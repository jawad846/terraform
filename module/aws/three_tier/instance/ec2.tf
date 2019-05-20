resource "aws_instance" "appserver" {
    count                         = "${var.count}"
    ami                           = "${var.ami}"
    instance_type                 = "t2.micro"
    subnet_id                     = "${element(var.ec2_subnets,count.index)}"
    associate_public_ip_address   = "False"
    vpc_security_group_ids        = ["${var.ec2_sgp}"]
    key_name                      = "jawad_test"
    root_block_device = {
        volume_type                 = "gp2"
        volume_size                 = "10"
        delete_on_termination       = true
        }
  tags {
      Name = "ec2_instance_${element(var.ec2_subnets,count.index)}"
      }
  volume_tags {
      Name = "ec2_instance_${element(var.ec2_subnets,count.index)}"
      }
}