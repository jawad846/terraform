#######################
#EC2 Network Interface#
#######################
resource "aws_network_interface" "ec2_eni" {
  subnet_id       = var.ec2_eni_subnet_id
  security_groups = var.ec2_eni_security_groups

  tags = {
    
  }
}

##############
#EC2 Instance#
##############
resource "aws_instance" "ec2_instance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  iam_instance_profile        = var.ec2_iam_instance_profile
  key_name                    = var.ec2_key_name
  disable_api_termination     = var.ec2_disable_api_termination
  associate_public_ip_address = var.ec2_associate_public_ip_address
  root_block_device  {
    volume_type               = var.ec2_root_volume_type
    volume_size               = var.ec2_root_volume_size
    delete_on_termination     = var.ec2_root_delete_on_termination
  }
  ebs_block_device {
    device_name               = var.ec2_ebs_device_name
    volume_type               = var.ec2_ebs_volume_type
    volume_size               = var.ec2_ebs_volume_size
    delete_on_termination     = var.ec2_ebs_delete_on_termination
  }

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ec2_eni.id

  }

  tags = {
    
  }
  volume_tags = {
    
  }
}