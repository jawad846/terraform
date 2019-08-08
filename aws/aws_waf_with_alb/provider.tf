# Define AWS as our provider
provider "aws" {
  region                  = "${var.region}"
  profile                 = "${var.profile}"
  # access_key              = "${var.key_access}"
  # secret_key              = "${var.key_secret}"
}