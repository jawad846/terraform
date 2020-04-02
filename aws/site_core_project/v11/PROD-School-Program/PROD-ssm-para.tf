#KMS

resource "aws_kms_key" "kms_ssm_key" {
    # customer_master_key_spec            = "SYMMETRIC_DEFAULT"
    description                         = "KMS Key for Password Encryption"
    deletion_window_in_days             = 7
    tags        {
        Name                    = "kms_ssm_pass_key"
        
    }
}


resource "aws_kms_alias" "kms_ssm_key_alias" {
  name          = "alias/kms-pass-key"
  target_key_id = "${aws_kms_key.kms_ssm_key.key_id}"
}


# resource "aws_kms_grant" "kms_ssm_key_grant" {
#   name                  = "kms_ssm_key_grant"
#   key_id                = "${aws_kms_key.kms_ssm_key.key_id}"
#   grantee_principal     = "${var.kms_admin_user}"
#   retiring_principal    = "${var.kms_admin_user}"
#   operations            = ["Decrypt", "Encrypt", "GenerateDataKey", "GenerateDataKeyWithoutPlaintext", "ReEncryptFrom", "ReEncryptTo", "CreateGrant", "RetireGrant", "DescribeKey"]

#   constraints {
#     encryption_context_equals = {
#       Department = "Security"
#     }
#   }
# }

#########################################


resource "aws_ssm_parameter" "domain_username" {
  name        = "/domain/username"
  description = "Domain username"
  type        = "String"
  value       = "${var.domain_username}"
  overwrite   = true
}

resource "aws_ssm_parameter" "domain_password" {
  name        = "/domain/password"
  description = "Domain password"
  type        = "SecureString"
  value       = "${var.domain_password}"
  key_id      = "${aws_kms_key.kms_ssm_key.arn}"
  overwrite   = true
}


resource "aws_ssm_parameter" "domain_name" {
  name        = "/domain/name"
  description = "Domain name"
  type        = "String"
  value       = "${var.domain_name}"
  overwrite   = true
}

resource "aws_ssm_parameter" "certificate_password" {
  name        = "/certificate/password"
  description = "Certificate password"
  type        = "SecureString"
  value       = "${var.certificate_password}"
  key_id      = "${aws_kms_key.kms_ssm_key.arn}"
  overwrite   = true
}
