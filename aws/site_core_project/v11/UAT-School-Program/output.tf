output "UAT_VPC_ID" {
  value = "${aws_vpc.vpcs.id}"
}

output "Content_Delivery" {
  value = "${aws_instance.ec2_content_delivery_01.id}"
}

output "Content_Delivery_pvt_ip" {
  value = "${aws_instance.ec2_content_delivery_01.private_ip}"
}



output "Solr_Master" {
  value = "${aws_instance.ec2_solr_master.id}"
}

output "Solr_Master_pvt_ip" {
  value = "${aws_instance.ec2_solr_master.private_ip}"
}

output "Solr_Slave_01" {
  value = "${aws_instance.ec2_solr_slave_01.id}"
}

output "Solr_Slave_01_pvt_ip" {
  value = "${aws_instance.ec2_solr_slave_01.private_ip}"
}

output "Solr_Slave_02" {
  value = "${aws_instance.ec2_solr_slave_01.id}"
}

output "Solr_Slave_02_pvt_ip" {
  value = "${aws_instance.ec2_solr_slave_01.private_ip}"
}

output "Content_Management_Processing" {
  value = "${aws_instance.ec2_content_management_processing.id}"
}


output "Content_Management_Processing_pvt_ip" {
  value = "${aws_instance.ec2_content_management_processing.private_ip}"
}


output "Content_Delivery_DB" {
  value = "${aws_instance.ec2_content_delivery_db.id}"
}

output "Content_Delivery_DB_pvt_ip" {
  value = "${aws_instance.ec2_content_delivery_db.private_ip}"
}

output "Content_Management_DB" {
  value = "${aws_instance.ec2_content_management_db.id}"
}


output "Content_Management_DB_pvt_ip" {
  value = "${aws_instance.ec2_content_management_db.private_ip}"
}