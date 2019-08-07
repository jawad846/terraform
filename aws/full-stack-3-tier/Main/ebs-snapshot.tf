data "aws_iam_role" "dlm_role" {
    name = "dlm-lifecycle-role"
}

resource "aws_dlm_lifecycle_policy" "snapshot_policy" {
  description        = "DLM lifecycle policy0145"
  execution_role_arn = "${data.aws_iam_role.dlm_role.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "2 weeks of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["01:45"]
      }

      retain_rule {
        count = 14
      }

      tags_to_add {
        SnapshotCreator = "DLM"
      }
      copy_tags = true
    }

    target_tags {
      dlm = "true"
    }
  }
}