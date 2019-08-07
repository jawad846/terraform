resource "aws_instance" "web_server_1a" {
  ami                         = "${var.web_ami}"
  instance_type               = "${var.web_instance_type}"
  subnet_id                   = "${aws_subnet.sub_web_1a.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_web.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true
  ebs_optimized               = true

  tags = {
    Name = "web_server_1a"
    donotstop = "donotstop"
  }
  volume_tags {
    Name = "ebs_web_server_1a"
    snapshot = "true"
  }
}

resource "aws_eip" "web_server_1a" {
  vpc      = true
  instance = "${aws_instance.web_server_1a.id}"
  tags {
    Name  = "eip_web_server_1a"
  }
}

# # second web server

resource "aws_instance" "web_server_1b" {
  ami                         = "${var.web_ami}"
  instance_type               = "${var.web_instance_type}"
  subnet_id                   = "${aws_subnet.sub_web_1b.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_web.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true
  ebs_optimized               = true

  tags = {
    Name = "web_server_1b"
    donotstop = "donotstop"
  }
  volume_tags {
    Name = "ebs_web_server_1b"
    dlm = "true"
  }
}


resource "aws_eip" "web_server_1b" {
  vpc      = true
  instance = "${aws_instance.web_server_1b.id}"
  tags {
    Name  = "eip_web_server_1b"
  }
}