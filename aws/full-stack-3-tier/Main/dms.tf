# Create a new replication subnet group
resource "aws_dms_replication_subnet_group" "replication_subgrp" {
  replication_subnet_group_description = "Replication Subnet group for website RDS to Singapure"
  replication_subnet_group_id          = "website-rds-replication-subgrp"

  subnet_ids = [
    "${aws_subnet.sub_rds_1a.id}","${aws_subnet.sub_rds_1b.id}"
  ]

  tags = {
    Name = "website-rds-replication-subgrp"
  }
}


# Create a new replication instance
resource "aws_dms_replication_instance" "website-rds-replication-instance" {
    replication_instance_id                 = "website-rds-replication"
    replication_instance_class              = "dms.t2.medium"
    allocated_storage                       = "50"
    multi_az                                = false
    publicly_accessible                     = false
    availability_zone                       = "ap-south-1a"
    replication_subnet_group_id             = "${aws_dms_replication_subnet_group.replication_subgrp.id}"
    vpc_security_group_ids                  = ["${aws_security_group.sg_dms_replication.id}"]
    preferred_maintenance_window            = "sat:18:30-sat:20:30"
    auto_minor_version_upgrade              = true
    apply_immediately                       = true

    tags = {
        Name = "website-rds-replication-instance"
        
    }
}


# Create a Source endpoint
resource "aws_dms_endpoint" "website-rds-replication-endpoint-source" {
    endpoint_type               = "source"
    endpoint_id                 = "db-web-orcl-source"
    engine_name                 = "oracle"
    server_name                 = "${aws_db_instance.tst_web_db.address}"
    port                        = 1521
    ssl_mode                    = "none"
    username                    = "${var.rds_username}"
    password                    = "${var.rds_password}"
    database_name               = "${aws_db_instance.tst_web_db.name}"

  tags = {
    Name = "db-web-orcl-source"
    
  }
}


# Create a Target endpoint
resource "aws_dms_endpoint" "website-rds-replication-endpoint-target" {
    endpoint_type               = "target"
    endpoint_id                 = "db-web-orcl-target"
    engine_name                 = "oracle"
    server_name                 = "${data.aws_db_instance.dr_rds_orcl.address}"
    port                        = 1521
    ssl_mode                    = "none"
    username                    = "${var.dr_db_username}"
    password                    = "${var.dr_db_password}"
    database_name               = "${data.aws_db_instance.dr_rds_orcl.db_name}"

  tags = {
    Name = "db-web-orcl-target"
    
  }
}


# Create a new replication task
resource "aws_dms_replication_task" "website-rds-replication-task" {
    replication_task_id                 = "website-rds-replication-task"
    replication_instance_arn            = "${aws_dms_replication_instance.website-rds-replication-instance.replication_instance_arn}"
    source_endpoint_arn                 = "${aws_dms_endpoint.website-rds-replication-endpoint-source.endpoint_arn }"
    target_endpoint_arn                 = "${aws_dms_endpoint.website-rds-replication-endpoint-target.endpoint_arn }"
     migration_type                     = "full-load-and-cdc"
     table_mappings            = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"examplePRTL_DXP_NEW_1\",\"table-name\":\"%\"},\"rule-action\":\"include\"}]}"
     replication_task_settings  = "{\"TargetMetadata\":{\"TargetSchema\":\"orcl_user\",\"SupportLobs\":true,\"FullLobMode\":false,\"LobChunkSize\":64,\"LimitedSizeLobMode\":true,\"LobMaxSize\":32,\"InlineLobMaxSize\":0,\"LoadMaxFileSize\":0,\"ParallelLoadThreads\":0,\"ParallelLoadBufferSize\":0,\"BatchApplyEnabled\":false,\"TaskRecoveryTableEnabled\":false},\"FullLoadSettings\":{\"TargetTablePrepMode\":\"DROP_AND_CREATE\",\"CreatePkAfterFullLoad\":false,\"StopTaskCachedChangesApplied\":false,\"StopTaskCachedChangesNotApplied\":false,\"MaxFullLoadSubTasks\":8,\"TransactionConsistencyTimeout\":600,\"CommitRate\":10000},\"Logging\":{\"EnableLogging\":false,\"LogComponents\":[{\"Id\":\"SOURCE_UNLOAD\",\"Severity\":\"LOGGER_SEVERITY_DEFAULT\"},{\"Id\":\"SOURCE_CAPTURE\",\"Severity\":\"LOGGER_SEVERITY_DEFAULT\"},{\"Id\":\"TARGET_LOAD\",\"Severity\":\"LOGGER_SEVERITY_DEFAULT\"},{\"Id\":\"TARGET_APPLY\",\"Severity\":\"LOGGER_SEVERITY_DEFAULT\"},{\"Id\":\"TASK_MANAGER\",\"Severity\":\"LOGGER_SEVERITY_DEFAULT\"}],\"CloudWatchLogGroup\":null,\"CloudWatchLogStream\":null},\"ControlTablesSettings\":{\"historyTimeslotInMinutes\":5,\"ControlSchema\":\"\",\"HistoryTimeslotInMinutes\":5,\"HistoryTableEnabled\":false,\"SuspendedTablesTableEnabled\":false,\"StatusTableEnabled\":false},\"StreamBufferSettings\":{\"StreamBufferCount\":3,\"StreamBufferSizeInMB\":8,\"CtrlStreamBufferSizeInMB\":5},\"ChangeProcessingDdlHandlingPolicy\":{\"HandleSourceTableDropped\":true,\"HandleSourceTableTruncated\":true,\"HandleSourceTableAltered\":true},\"ErrorBehavior\":{\"DataErrorPolicy\":\"LOG_ERROR\",\"DataTruncationErrorPolicy\":\"LOG_ERROR\",\"DataErrorEscalationPolicy\":\"SUSPEND_TABLE\",\"DataErrorEscalationCount\":0,\"TableErrorPolicy\":\"SUSPEND_TABLE\",\"TableErrorEscalationPolicy\":\"STOP_TASK\",\"TableErrorEscalationCount\":0,\"RecoverableErrorCount\":-1,\"RecoverableErrorInterval\":5,\"RecoverableErrorThrottling\":true,\"RecoverableErrorThrottlingMax\":1800,\"ApplyErrorDeletePolicy\":\"IGNORE_RECORD\",\"ApplyErrorInsertPolicy\":\"LOG_ERROR\",\"ApplyErrorUpdatePolicy\":\"LOG_ERROR\",\"ApplyErrorEscalationPolicy\":\"LOG_ERROR\",\"ApplyErrorEscalationCount\":0,\"ApplyErrorFailOnTruncationDdl\":false,\"FullLoadIgnoreConflicts\":true,\"FailOnTransactionConsistencyBreached\":false,\"FailOnNoTablesCaptured\":false},\"ChangeProcessingTuning\":{\"BatchApplyPreserveTransaction\":true,\"BatchApplyTimeoutMin\":1,\"BatchApplyTimeoutMax\":30,\"BatchApplyMemoryLimit\":500,\"BatchSplitSize\":0,\"MinTransactionSize\":1000,\"CommitTimeout\":1,\"MemoryLimitTotal\":1024,\"MemoryKeepTime\":60,\"StatementCacheSize\":50},\"PostProcessingRules\":null}"

  tags = {
    Name = "website-rds-replication-task"
    
  }
}