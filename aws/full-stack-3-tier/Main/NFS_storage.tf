resource "aws_instance" "nfs_server" {
  ami                         = "${var.nfs_ami}"
  instance_type               = "${var.nfs_instance_type}"
  subnet_id                   = "${aws_subnet.sub_app_1a.id}"
  associate_public_ip_address = false
  private_ip                  = "${var.nfs_pvt_ip}"
  vpc_security_group_ids      = ["${aws_security_group.sg_nfs_server.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true

  ebs_block_device = {
    device_name = "/dev/sdb"
    volume_type = "gp2"
    volume_size = "150"
    snapshot_id = "${var.snap-nfs-server}"
    delete_on_termination = false
  }
  tags = {
    Name = "nfs_server"
    donotstop = "donotstop"
    
  }
  volume_tags {
    Name = "ebs_nfs_server"
    snapshot = "true"
    
  }
}

