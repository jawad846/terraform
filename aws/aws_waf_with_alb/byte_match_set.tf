resource "aws_wafregional_byte_match_set" "wafrgbytems_alb_web_server" {
  name = "${var.name_bytems}"

  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "sogou"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "voltron"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
    text_transformation   = "CMD_LINE"
    target_string         = "wpspider"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
    byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "etaospider"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "baidu"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "yandex"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "adnormcrawler"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "wordpress"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}

resource "aws_wafregional_byte_match_set" "wafrgbytems_alb_web_server_2" {
  name = "${var.name_bytems_1}"
byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "curl"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "urllib"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "python"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "wget"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "ruby"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "java"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
  byte_match_tuples {
        text_transformation   = "CMD_LINE"
        target_string         = "libwww"
        positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}