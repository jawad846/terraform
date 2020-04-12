provider "aws" {
    alias                    = "expotest"
    region                   = "${var.expotest_region}"
    access_key               = "${var.expotest_access_key}"
    secret_key               = "${var.expotest_secret_key}"
}

provider "aws" {
    alias                    = "expodev"
    region                   = "${var.expodev_region}"
    access_key               = "${var.expodev_access_key}"
    secret_key               = "${var.expodev_secret_key}"
}

provider "aws" {
    alias                    = "expoprod"
    region                   = "${var.expoprod_region}"
    access_key               = "${var.expoprod_access_key}"
    secret_key               = "${var.expoprod_secret_key}"
}

provider "aws" {
    alias                    = "expodx"
    region                   = "${var.expodx_region}"
    access_key               = "${var.expodx_access_key}"
    secret_key               = "${var.expodx_secret_key}"
}

provider "aws" {
    alias                    = "exposhared"
    region                   = "${var.exposhared_region}"
    access_key               = "${var.exposhared_access_key}"
    secret_key               = "${var.exposhared_secret_key}"
}

provider "aws" {
    alias                    = "expomgmt"
    region                   = "${var.expomgmt_region}"
    access_key               = "${var.expomgmt_access_key}"
    secret_key               = "${var.expomgmt_secret_key}"
}