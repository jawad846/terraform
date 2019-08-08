resource "aws_wafregional_web_acl" "wafrgacl_api-test-mobile" {
  name        = "${var.name_wafregional_acl}"
  metric_name = "${var.metric_wafregional_acl}"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }
    priority = 1
    rule_id  = "${aws_wafregional_rule.wafrgrule_api-test-mobile.id}"
  }
}


resource "aws_wafregional_web_acl_association" "wafrgacl_acctn_api-test-mobile" {
  resource_arn = "${aws_lb.alb_api_test_mobile_expo2020dubai.arn}"
  web_acl_id   = "${aws_wafregional_web_acl.wafrgacl_api-test-mobile.id}"
}