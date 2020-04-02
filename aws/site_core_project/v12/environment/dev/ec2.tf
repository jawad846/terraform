// module "ec2_dev_content_delivery" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_content_devlivery.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "c5.4xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }

// module "ec2_dev_solr_master" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_solr_master.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "m5.2xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }

// module "ec2_dev_solr_slave" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_solr_slave.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "m5.2xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }


// module "ec2_dev_content_mgmt" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_content_mgmt.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "c5.4xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }

// module "ec2_dev_content_delivery_db" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_content_delivery_db.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "c5.2xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }


// module "ec2_dev_content_mgmt_db" {
//   source = "../../modules/ec2-instance"

//   ec2_eni_subnet_id        = module.dev_vpc.sub_app_pvt_1a
//   ec2_eni_security_groups  = module.dev_ec2_sgs_content_mgmt_db.security_group_id
//   ec2_ami                  = ami-
//   ec2_instance_type        = "c5.2xlarge"
//   ec2_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_key_name             = dev_scp_key
//   ec2_root_volume_type     = "gp2"
//   ec2_root_volume_size     = 100
//   ec2_ebs_device_name      = /dev/sdb
//   ec2_ebs_volume_type      = "gp2"
//   ec2_ebs_volume_size      = 100

// }