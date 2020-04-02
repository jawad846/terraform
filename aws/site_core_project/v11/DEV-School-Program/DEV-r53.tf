# resource "aws_route53_zone" "scp_r53" {
#     name                = "${var.scp_r53}"
#     comment             = "${var.scp_r53_comment}"
#   vpc {
#     vpc_id = "${aws_vpc.vpcs.id}"
#   }
# }
# ###############
# resource "aws_route53_record" "scp_r53_cd" {
#   zone_id = "${aws_route53_zone.scp_r53.zone_id}"
#   name    = "${var.scp_r53_cd}.${var.scp_r53}"
#   type    = "A"
#   ttl     = "300"
#   records = ["${aws_instance.ec2_content_delivery_01.private_ip}"]
# }
# resource "aws_route53_record" "scp_r53_cm" {
#   zone_id = "${aws_route53_zone.scp_r53.zone_id}"
#   name    = "${var.scp_r53_cm}.${var.scp_r53}"
#   type    = "A"
#   ttl     = "300"
#   records = ["${aws_instance.ec2_content_management_processing.private_ip}"]
# }
