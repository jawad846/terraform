
resource "aws_instance" "ec2_content_delivery_01" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_content_delivery_01}"
  subnet_id                   = "${aws_subnet.sub_app_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_content_delivery.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "200"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_content_delivery_01}"
    NAME                    = "${var.host_content_delivery_01}"
    
  }
  volume_tags  {
    Name                    = "${var.ec2_name_content_delivery_01}"
    NAME                    = "${var.host_content_delivery_01}"
    
  }
}


resource "aws_instance" "ec2_solr_master" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_solr_master}"
  subnet_id                   = "${aws_subnet.sub_app_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_solr_master.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "200"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_solr_master}"
    NAME                    = "${var.host_solr_master}"
    
  }
  volume_tags {
    Name                    = "${var.ec2_name_solr_master}"
    NAME                    = "${var.host_solr_master}"
    
  }
}

resource "aws_instance" "ec2_solr_slave_01" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_solr_slave_01}"
  subnet_id                   = "${aws_subnet.sub_app_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_solr_slave_01.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "200"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_solr_slave_01}"
    NAME                    = "${var.host_solr_slave_01}"
  
  }
  volume_tags  {
    Name                    = "${var.ec2_name_solr_slave_01}"
    NAME                    = "${var.host_solr_slave_01}"
    
  }
}
resource "aws_instance" "ec2_solr_slave_02" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_solr_slave_02}"
  subnet_id                   = "${aws_subnet.sub_app_pvt_1b.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_solr_slave_02.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "200"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_solr_slave_02}"
    NAME                    = "${var.host_solr_slave_02}"

  }
  volume_tags  {
    Name                    = "${var.ec2_name_solr_slave_02}"
    NAME                    = "${var.host_solr_slave_02}"
    
  }
}


resource "aws_instance" "ec2_content_management_processing" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_content_management_processing}"
  subnet_id                   = "${aws_subnet.sub_app_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_content_management_processing.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "200"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_content_management_processing}"
    NAME                    = "${var.host_content_management_processing}"
   
  }
  volume_tags  {
    Name                    = "${var.ec2_name_content_management_processing}"
    NAME                    = "${var.host_content_management_processing}"
    
  }
}

resource "aws_instance" "ec2_content_delivery_db" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_content_delivery_db}"
  subnet_id                   = "${aws_subnet.sub_db_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_content_delivery_db.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "300"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_content_delivery_db}"
    NAME                    = "${var.host_content_delivery_db}"
    
  }
  volume_tags  {
    Name                    = "${var.ec2_name_content_delivery_db}"
    NAME                    = "${var.host_content_delivery_db}"
   
  }
}

resource "aws_instance" "ec2_content_management_db" {
  ami                         = "${var.windows_ami}"
  instance_type               = "${var.ec2_type_content_management_db}"
  subnet_id                   = "${aws_subnet.sub_db_pvt_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_content_management_db.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2_profile_role.name}"
  key_name                    = "${var.uat_key_pair}"
  disable_api_termination     = false
  ebs_block_device   {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "300"
    delete_on_termination = true
  }

  tags  {
    Name                    = "${var.ec2_name_content_management_db}"
    NAME                    = "${var.host_content_management_db}"
    
  }
  volume_tags  {
    Name                    = "${var.ec2_name_content_management_db}"
    NAME                    = "${var.host_content_management_db}"
   
  }
}