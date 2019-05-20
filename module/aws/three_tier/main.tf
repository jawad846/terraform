module "pr_vpc" {
  source = "/Users/jawad/workspace/jawad846/terraform/module/aws/3-tier/network"

vpc_cidr                        = "172.27.0.0/16"
stagging_worker_subnet_cidr     = ["172.27.0.0/24","172.27.1.0/24","172.27.2.0/24"]
prod_worker_subnet_cidr         = ["172.27.3.0/24","172.27.4.0/24","172.27.5.0/24"]
prod_master_subnet_cidr         = ["172.27.8.0/24","172.27.7.0/24","172.27.6.0/24"]
}

######
module "pr_instance" {
  source = "/Users/jawad/workspace/jawad846/terraform/module/aws/3-tier/instance/"

count = "2"
ami = "ami-0a574895390037a62"
ec2_subnets = "${module.pr_vpc.out_prod_worker_subnet}"
ec2_sgp = "${module.pr_vpc.out_sg_instance}"
}

########
module "pr_database" {
  source = "/Users/jawad/workspace/jawad846/terraform/module/aws/3-tier/database/"

db_sub_goup       = "${module.pr_vpc.out_prod_master_subnet}"
db_pg_family      = "mysql5.7"
count             = "1"
rds_storage       = "50"
rds_engine        = "mysql"
engine_version    = "5.7.22"
rds_instanceclass = "db.t2.micro"
rds_username      = "user_my"
rds_password      = "Test@1234"
sg_rds            = "${module.pr_vpc.out_sg_database}"
}

##########

module "pr_alb" {
  source = "/Users/jawad/workspace/jawad846/terraform/module/aws/3-tier/loadbalancer/"

sg_web_alb            = "${module.pr_vpc.out_sg_alb}"
alb_sub               = "${module.pr_vpc.out_stagging_worker_subnet}"
https_certificate_arn = "arn:aws:acm:ap-south-1:323981986726:certificate/6d698042-ccb3-4e08-945a-244b8615732a"
alb_vpc               = "${module.pr_vpc.out_vpc}"
ec2_target            = "${module.pr_instance.out_ec2_instance}"
}