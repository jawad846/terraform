output "out_vpc" {
  value = "${aws_vpc.prod.id}"
}


output "out_prod_master_subnet" {
  value = ["${aws_subnet.prod_master_subnet.*.id}"]
}

output "out_prod_worker_subnet" {
  value = ["${aws_subnet.prod_worker_subnet.*.id}"]
}

output "out_stagging_worker_subnet" {
  value = ["${aws_subnet.stagging_worker_subnet.*.id}"]
}

output "out_sg_instance" {
  value = "${aws_security_group.sg_instance.id}"
}

output "out_sg_database" {
  value = "${aws_security_group.sg_database.id}"
}

output "out_sg_alb" {
  value = "${aws_security_group.sg_alb.id}"
}


