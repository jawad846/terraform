# Users

output "ahmed_gabran" {
  value = "${aws_iam_user.ahmed_gabran.name}"
}
output "alfonso" {
  value = "${aws_iam_user.alfonso.name}"
}

output "saja_abu_gharbieh" {
  value = "${aws_iam_user.saja_abu_gharbieh.name}"
}

output "jaydeep_prajapati" {
  value = "${aws_iam_user.jaydeep_prajapati.name}"
}

output "khallad_albader" {
  value = "${aws_iam_user.khallad_albader.name}"
}


output "mukhamed_abu" {
  value = "${aws_iam_user.mukhamed_abu.name}"
}

output "venkatesan_selvaraj" {
  value = "${aws_iam_user.venkatesan_selvaraj.name}"
}



##########################################################

#Roles
output "switch_role_test_account" {
  value = "${aws_iam_role.expotest.arn}"
}

output "switch_role_dev_account" {
  value = "${aws_iam_role.expodev.arn}"
}

output "switch_role_prod_account" {
  value = "${aws_iam_role.expoprod.arn}"
}

output "switch_role_dx_account" {
  value = "${aws_iam_role.expodx.arn}"
}

output "switch_role_shared_account" {
  value = "${aws_iam_role.exposhared.arn}"
}

output "switch_role_mgmt_account" {
  value = "${aws_iam_role.expomgmt.arn}"
}

##############################################################################

output "Access_to__test" {
  value = "${aws_iam_role.res_readonly_test.arn}"
}

output "Access_to__dev" {
  value = "${aws_iam_role.res_readonly_dev.arn}"
}

output "Access_to__dx" {
  value = "${aws_iam_role.res_readonly_dx.arn}"
}

output "Access_to__shared" {
  value = "${aws_iam_role.res_readonly_shared.arn}"
}

output "Access_to__mgmt" {
  value = "${aws_iam_role.res_readonly_mgmt.arn}"
}

output "Access_to__prod" {
  value = "${aws_iam_role.res_readonly_prod.arn}"
}

