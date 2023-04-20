### 工具介紹
    tool內含有3張table及3個store procedure
        table : `batch_delete`, `delete_process_config`, `routine_delete_table`
        store procedure : `batch_delete`, `delete_process`
### table 介紹
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
                    `config_value` varchar(64) DEFAULT NULL,       # 若config_key為`enable`且config_value設為1則可正常執行，設為0時不執行delete_process store
                                                                     precedure。若config_key為`emergency_stop`且config_value設為1則會開啟緊急停止功能，後續delete_routine_table未執行的部分會跳過，預設為0。
                    `created_at` datetime DEFAULT NULL,            # 建立該row時間。
                    `updated_at` datetime DEFAULT NULL,            # 更新設置時間。
                    PRIMARY KEY (`sn`))

    `routine_delete_table` ：
                  （`sn` int(10) unsigned NOT NULL AUTO_INCREMENT,   
                    `exec_database` varchar(64) NOT NULL,            # 資料庫名稱。需手動填值。
                    `exec_table` varchar(128) NOT NULL,              # 表名稱。需手動填值。
                    `routine_type` char(1) NOT NULL,                 # 刪除時間格式，如：y, m, d。需手動填值。
                    `delete_type` varchar(16) NOT NULL,              # 刪除類型，如：delete_record, drop_table, drop_partition。需手動填值。
                    `time_interval` int(10) unsigned NOT NULL,       # 刪除時間間隔，搭配routine_type使用，如:若routine_type為d，time_interval為90，
                                                                       表示刪除90天前的資料。需手動填值。
                    `delete_key` varchar(64) DEFAULT NULL,           # 刪除關鍵，依delete_type有不同填法，delete_record填column name。drop_table填null。
                                                                       drop_partition填去除末尾的date format後的partition name前綴，如：partition_name為p_20230101，則填入p_。需手動填值。
                    `is_enabled` int(10) unsigned NOT NULL,          # 是否可執行，填1為可，0為不可。需手動填值。
                    `lastest_start_at` datetime DEFAULT NULL,        # 該row最新執行開始時間。不需手動填值。
                    `lastest_finish_at` datetime DEFAULT NULL,       # 該row最新結束時間。不需手動填值。
                    `lastest_duration_second` double DEFAULT NULL,   # 該row最新執行耗用時間。不需手動填值。
                    `lastest_exec_cmd` varchar(256) DEFAULT NULL,    # 該row最新執行指令。不需手動填值。
                    `lastest_err_msg` varchar(128) DEFAULT NULL,     # 該row最新錯誤訊息。不需手動填值。
                    `batch_delete_id` int(10) unsigned DEFAULT NULL, # 該row最新刪除id。此id與batch_delete table中id一樣。delete_record才會有值。不需手動填值。
                    `created_at` datetime DEFAULT NULL,              # 該row創建時間。不需手動填值。
                    `updated_at` datetime DEFAULT NULL,              # 該row更新時間。不需手動填值。
                    PRIMARY KEY (`sn`),
                    KEY `idx-batch_delete_id` (`batch_delete_id`)
                    

### store procedure介紹
	`batch_delete` : call batch_delete()時丟入參數
                            （IN exec_schema VARCHAR(50), 
                             IN exec_table VARCHAR(50), 
                             IN where_condition VARCHAR(200), 例：'createtime < 20230101'。
                             IN batch_rows INT 填入一次需刪除筆數，預設為10000筆，可不填）
                             執行後可於`batch_delete`table觀察delete_record狀況。
                    
	`delete_process` :  於每日執行時間前將要刪除的相關資料參照table介紹照格式填入’routine_delete_table’ 表中，
                        執行後可於`routine_delete_table`中觀察填入資料刪除狀況，有無成功執行，若無成功執行刪除資料會有錯誤訊息可查看。
                        delete_record部分是call batch_delete做的，要查看詳細刪除資訊可查看batch_delete_table。

                        ！!注意：
                            1. 在每日執行時間前可更改 ‘delete_process_config’ 表中的 ‘config_key’ 欄位內為enable的row中將 ’config_value’ 欄位，
                                注：填0或off可關閉刪除功能，但須記得手動調回。

                            2. 在刪除中如需緊急停止某項刪除操作，可於 ‘delete_process_config’ 表中的 ‘config_key’ 欄位內為 emergency_stop 的row中將 
                                ‘config_value’ 欄位改為1，可緊急取消刪除尚未執行刪除的部分。
                                注：此選項將會每日初始化。不必手動調回。

                            3.  delete_record部分可刪除輸入的time_interval與routine_type換算過的時間前的所有資料；
                                drop_table僅刪除輸入的time_interval與routine_type換算過的時間的單張table，如time_interval = 90, routine_type = 'd'，今日為4月1日僅會刪除90天前1月1號當天的table；
                                drop_partition僅刪除輸入的time_interval與routine_type換算過的時間的單個partition，如time_interval = 3, routine_type = 'm'，今日為4月1日僅會刪除3個月前1月號當月的partition；


