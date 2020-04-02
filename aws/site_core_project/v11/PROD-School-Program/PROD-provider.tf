# Define AWS as our provider
provider "aws" {
  region                  = "${var.aws_region}"
  profile                 = "${var.aws_profile}"
}

provider "aws" {
  alias   = "test_vpc"
  region  = "${var.aws_region}"
  profile = "${var.accepter01_profile}"
}


provider "aws" {
  alias   = "mgmt_vpc"
  region  = "${var.aws_region}"
  profile = "${var.accepter02_profile}"
}

