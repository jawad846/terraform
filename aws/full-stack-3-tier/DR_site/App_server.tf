resource "aws_instance" "app_server" {
  ami                         = "${var.app_ami}"
  instance_type               = "${var.app_instance_type}"
  subnet_id                   = "${aws_subnet.dr_sub_app_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_app.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = "true"

  tags = {
    Name = "app_server"
    donotstop = "donotstop"
    
  }
  volume_tags {
    Name = "ebs_app_server"
    snapshot = "true"
    
  }
}