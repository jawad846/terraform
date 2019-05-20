output "out_ec2_instance" {
  value = "${aws_instance.appserver.*.id}"
}

output "out_ec2_count" {
  value = "${aws_instance.appserver.}"
}

