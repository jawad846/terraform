resource "aws_launch_template" "app-server" {
  name                              = "lt_app_server"
  description                       = "Launch Template of the App Server"
  image_id                          = "${var.app_ami}"
  instance_type                     = "${var.app_instance_type}"
  key_name                          = "${var.key_pair}"
  vpc_security_group_ids            = ["${aws_security_group.sg_app.id}"]
  iam_instance_profile               {
      name                              = "${aws_iam_instance_profile.ec2_profile_role.name}"
  }

  tag_specifications                 {
    resource_type       = "instance"
    tags          = {
      Name      = "App-Server"
    }
  }
  tag_specifications                 {
    resource_type       = "volume"
    tags          = {
      Name      = "App-Server"
    }
  }

  tags                   { 
    Name        = "lt_app_server"
  }
}

####################################
resource "aws_launch_template" "web-server" {
  name                              = "lt_web_server"
  description                       = "Launch Template of the Web Server"
  image_id                          = "${var.web_ami}"
  instance_type                     = "${var.web_instance_type}"
  key_name                          = "fed-web-mumbai"
  network_interfaces {
        associate_public_ip_address = true
        security_groups             = ["${aws_security_group.sg_web.id}"]
        delete_on_termination       = true
    }
  iam_instance_profile               {
      name                              = "${aws_iam_instance_profile.ec2_profile_role.name}"
  }

  tag_specifications                 {
    resource_type       = "instance"
    tags          = {
      Name      = "Web-Server"
      PONumber  = "ITS430912019"
    }
  }
  tag_specifications                {
    resource_type       = "volume"
    tags          = {
      Name      = "Web-Server"
      PONumber  = "ITS430912019"
    }
  }
  
  tags                   {
    Name        = "lt_web_server"
  }
}


# resource "aws_launch_configuration" "app_server" {
#   name                          = "lc_app_server"
#   image_id                      = "${var.app_ami}"
#   instance_type                 = "${var.app_instance_type}"
#   iam_instance_profile          = "${aws_iam_instance_profile.ec2_profile_role.role}"
#   security_groups               = ["${aws_security_group.sg_app.id}"]
#   key_name                      = "fed-app-mumbai"
#   associate_public_ip_address   = false

# }

# resource "aws_launch_configuration" "web_server" {
#   name                          = "lc_web_server"
#   image_id                      = "${var.web_ami}"
#   instance_type                 = "${var.web_instance_type}"
#   iam_instance_profile          = "${aws_iam_instance_profile.ec2_profile_role.role}"
#   security_groups               = ["${aws_security_group.sg_web.id}"]
#   key_name                      = "fed-web-mumbai"
#   associate_public_ip_address   = true
# }