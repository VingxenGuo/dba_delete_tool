### 工具介紹
    tool內含有3張table及3個store procedure
        table : `batch_delete`, `delete_process_config`, `routine_delete_table`
        store procedure : `batch_delete`, `delete_process`
## table 介紹
    `batch_delete` : 
                   (`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                    `connection_id` int(10) unsigned DEFAULT NULL, # 連線的mysql thread id，必要時可kill此connection。
                    `exec_table` varchar(64) DEFAULT NULL,         # 執行表。
                    `where_condition` varchar(256) DEFAULT NULL,   # 輸入的where condition，例：`createtime < 20230101`。
                    `chunk_number` int(10) unsigned DEFAULT NULL,  # 一次刪除rows數，預設為10000筆。
                    `delete_rate` float unsigned DEFAULT NULL,     # 該table 單次chunk 刪除速率，單位：rows數/每秒。
                    `total_affected_rows` int(11) DEFAULT NULL,    # 共刪除rows數。
                    `total_delete_rate` float DEFAULT NULL,        # 該table 目前刪除的delete rate。
                    `duration_second` double DEFAULT NULL,         # 持續時間。
                    `created_at` datetime DEFAULT NULL,            # 該sp被call時間。
                    `updated_at` datetime DEFAULT NULL,            # 因爲batch delete，此為每匹刪除的結束時間 。
                    `finished_at` datetime DEFAULT NULL,           # 結束時間。
                    PRIMARY KEY (`id`))          

    `delete_process_config` :
                   (`sn` int(10) unsigned NOT NULL AUTO_INCREMENT,
                    `config_key` varchar(64) DEFAULT NULL,         # 有`enable`及`emergency_stop`兩種選項。
                    `config_value` varchar(64) DEFAULT NULL,       # 若config_key為`enable`且config_value設為1則可正常執行，預設為1。若config_key為
                                                                     `emergency_stop`且config_value設為1則會開啟緊急停止功能，後續delete_routine_table未執行的部分會跳過，預設為0。
                    `created_at` datetime DEFAULT NULL,            # 建立該row時間。
                    `updated_at` datetime DEFAULT NULL,            # 更新設置時間。
                    PRIMARY KEY (`sn`))

    `routine_delete_table` ：
                  （`sn` int(10) unsigned NOT NULL AUTO_INCREMENT,   
                    `exec_database` varchar(64) NOT NULL,            # 資料庫名稱。
                    `exec_table` varchar(128) NOT NULL,              # 表名稱。
                    `routine_type` char(1) NOT NULL,                 # 刪除時間格式，如：y, m, d。
                    `delete_type` varchar(16) NOT NULL,              # 刪除類型，如：delete_record, drop_table, drop_partition。
                    `time_interval` int(10) unsigned NOT NULL,       # 刪除時間間隔，搭配routine_type使用，如:若routine_type為d，time_interval為90，
                                                                       表示刪除90天前的資料。
                    `delete_key` varchar(64) DEFAULT NULL,           # 刪除關鍵，依delete_type有不同填法，delete_record填column name。drop_table填null。
                                                                       drop_partition填去除末尾的date format後的partition name前綴，如：partition_name為p_20230101，則填入p_。
                    `is_enabled` int(10) unsigned NOT NULL,          # 是否可執行，填1為可，0為不可。
                    `lastest_start_at` datetime DEFAULT NULL,        # 該row最新執行開始時間。
                    `lastest_finish_at` datetime DEFAULT NULL,       # 該row最新結束時間。
                    `lastest_duration_second` double DEFAULT NULL,   # 該row最新執行耗用時間。
                    `lastest_exec_cmd` varchar(256) DEFAULT NULL,    # 該row最新執行指令。
                    `lastest_err_msg` varchar(128) DEFAULT NULL,     # 該row最新錯誤訊息。
                    `batch_delete_id` int(10) unsigned DEFAULT NULL, # 該row最新刪除id。此id與batch_delete table中id一樣。delete_record才會有值。
                    `created_at` datetime DEFAULT NULL,              # 該row創建時間。
                    `updated_at` datetime DEFAULT NULL,              # 該row更新時間。
                    PRIMARY KEY (`sn`),
                    KEY `idx-batch_delete_id` (`batch_delete_id`)
                    

### store procedure介紹
	`batch_delete` : 可返回使用delete_record刪除的rows數以及刪除速率。
	`delete_process` :  

### 操作手冊

將要刪除的table及相關資料填入’routine_delete_table’ 表中。
‘exec_databases’ : 填資料庫名稱。
‘exec_table’ : 填表名稱，如為drop_table，則不加用加上後綴的時間格式
‘routine_type’ : 為刪除的時間間隔。ex: 天(d)、月(m)、年(y)。
‘delete_type’ : 為刪除標的選擇。ex: delete_record、drop_partition、drop_table。
‘time_interval’ : 為多少間隔之前，如為一年前則routine_type填y，time_interval填1。
‘delete_key’ : 若delete type為delete_record則為column_name，若為drop_partition則填入 partition name的前綴， drop_table則為null。
‘is_enabled’ 可設定是否執行此刪除，若不需刪除可設為0，預設為1執行;
剩餘欄位無需填寫。
在每日執行時間前可更改 ‘delete_process_config’ 表中的 ‘config_key’ 欄位內為enable的row中將 ’config_value’ 欄位，填0或off可關閉刪除功能。
在刪除中如需緊急停止某項刪除操作，可於 ‘delete_process_config’ 表中的 ‘config_key’ 欄位內為 emergency_stop 的row中將 ‘config_value’ 欄位改為1，可緊急取消刪除尚未執行刪除的部分。
注：此選項將會每日初始化。

delete_record部分可刪除輸入的time_interval與routine_type換算過的時間前的資料；drop_table僅刪除輸入的time_interval與routine_type換算過的時間的table；
drop_partition僅刪除輸入的time_interval與routine_type換算過的時間的partition；
