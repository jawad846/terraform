resource "aws_instance" "app_server_1a" {
  ami                         = "${var.app_ami}"
  instance_type               = "${var.app_instance_type}"
  subnet_id                   = "${aws_subnet.sub_app_1a.id}"
  associate_public_ip_address = false
  private_ip                  = "${var.app_pvt_ip_1a}"
  vpc_security_group_ids      = ["${aws_security_group.sg_app.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true

  tags = {
    Name = "app_server_1a"
    donotstop = "donotstop"
  }
  volume_tags {
    Name = "ebs_app_server_1a"
    snapshot = "true"
  }
}

# # second app server

resource "aws_instance" "app_server_1b" {
  ami                         = "${var.app_ami}"
  instance_type               = "${var.app_instance_type}"
  subnet_id                   = "${aws_subnet.sub_app_1b.id}"
  associate_public_ip_address = false
  private_ip                  = "${var.app_pvt_ip_1b}"
  vpc_security_group_ids      = ["${aws_security_group.sg_app.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true

  tags = {
    Name = "app_server_1b"
    donotstop = "donotstop"
  }
  volume_tags {
    Name = "ebs_app_server_1b"
    dlm = "true"
  }
}