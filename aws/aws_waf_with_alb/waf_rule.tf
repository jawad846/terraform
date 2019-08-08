resource "aws_wafregional_rule" "wafrgrule_api-test-mobile" {
  name        = "${var.name_wafregional_rule}"
  metric_name = "${var.metric_wafregional_rule}"

  predicate {
    type    = "IPMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_ipset.wafrgips_api-test-mobile.id}"
    negated = false
  }

   predicate {
    type    = "IPMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_ipset.wafrgips_api-test-mobile_1.id}"
    negated = false
  }

  predicate {
    type    = "IPMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_ipset.wafrgips_api-test-mobile_2.id}"
    negated = false
  }


  predicate {
    type    = "IPMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_ipset.wafrgips_api-test-mobile_3.id}"
    negated = false
  }


  predicate {
    type    = "SqlInjectionMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_sql_injection_match_set.wafrgsqlinj_api-test-mobile.id}"
    negated = false
  }

  predicate {
    type    = "XssMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_xss_match_set.wafrgxssms_api-test-mobile.id}"
    negated = false
  }

  predicate {
    type    = "ByteMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_byte_match_set.wafrgbytems_api-test-mobile.id}"
    negated = false
  }
  predicate {
    type    = "ByteMatch"      #ByteMatch, GeoMatch, IPMatch, RegexMatch, SizeConstraint, SqlInjectionMatch, or XssMatch
    data_id = "${aws_wafregional_byte_match_set.wafrgbytems_api-test-mobile_2.id}"
    negated = false
  }
}