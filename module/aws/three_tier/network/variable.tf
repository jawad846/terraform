variable "vpc_cidr" {
  description = ""
}

variable "stagging_worker_subnet_cidr" {
  description = ""
  type = "list"
}

variable "prod_worker_subnet_cidr" {
  description = ""
  type = "list"
}

variable "prod_master_subnet_cidr" {
  description = ""
  type = "list"
}

