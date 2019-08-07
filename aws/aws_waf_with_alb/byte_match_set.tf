resource "aws_wafregional_byte_match_set" "wafrgbytems_api-test-mobile" {
  name = "${var.name_bytems}"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "sogou"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "voltron"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "wpspider"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
    byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "etaospider"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "baidu"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "yandex"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "adnormcrawler"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "wordpress"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
}

resource "aws_wafregional_byte_match_set" "wafrgbytems_api-test-mobile_2" {
  name = "${var.name_bytems}"
byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "curl"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "urllib"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "python"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "wget"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "ruby"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "java"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "libwww"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "User-Agent"
    }
  }
}