resource "aws_launch_template" "lt_scp_cd_server" {
    name                        = "${var.lt_scp_cd_server}"
    description                 = "Launch Template for CD Server"
    image_id                    = "${var.ami_lt_scp_cd_server}"
    instance_type               = "${var.ec2_type_content_delivery_01}"
    key_name                    = "${var.uat_key_pair}"
    vpc_security_group_ids      = ["${aws_security_group.sg_content_delivery.id}","${aws_security_group.sg_pam_citrix_mgmt.id}"]
    iam_instance_profile        {
        name            = "${aws_iam_instance_profile.ec2_profile_role.name}"
    }
    ebs_optimized           = "false"
    user_data               = "PHBvd2Vyc2hlbGw+CldyaXRlLU91dHB1dCAiSW5zdGFsbGluZyBSU0FULUFELVBvd2VyU2hlbGwiCkluc3RhbGwtV2luZG93c0ZlYXR1cmUgUlNBVC1BRC1Qb3dlclNoZWxsID4+IGM6XHVzZXJfZGF0YS5sb2cKYXdzIHMzIGNwICdzMzovL2V4cG8tbWdtdC9jZXJ0aWZpY2F0ZS9zY2hvb2xzLWV4cG8yMDIwLnBmeCcgQzpcY2VydGlmaWNhdGVzXCAtLXJlZ2lvbiBldS13ZXN0LTEKJGV4cG8yMDIwZHViYWlDZXJ0UGF0aCA9ICdjOlxjZXJ0aWZpY2F0ZXNcc2Nob29scy1leHBvMjAyMC5wZngnCiRjZXJ0UGFzcyA9IChHZXQtU1NNUGFyYW1ldGVyVmFsdWUgLU5hbWUgL2NlcnRpZmljYXRlL3Bhc3N3b3JkIC1XaXRoRGVjcnlwdGlvbiAkVHJ1ZSkuUGFyYW1ldGVyc1swXS5WYWx1ZSB8IENvbnZlcnRUby1TZWN1cmVTdHJpbmcgLUFzUGxhaW5UZXh0IC1Gb3JjZQokZXhwbzIwMjBkdWJhaVBhc3MgPSAkY2VydFBhc3MKR2V0LUNoaWxkSXRlbSBDZXJ0OlxMb2NhbE1hY2hpbmVcTXlcOUNCM0Q4NDdCNUIyNDgxNzU3QzYzQzM3NkVGMzVGQUYwRTFGNTlFRiAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZQppZiAoJD8pIHtHZXQtQ2hpbGRJdGVtIENlcnQ6XExvY2FsTWFjaGluZVxNeVw5Q0IzRDg0N0I1QjI0ODE3NTdDNjNDMzc2RUYzNUZBRjBFMUY1OUVGIHwgUmVtb3ZlLUl0ZW19CiRwZnhFeHBvMjAyMER1YmFpID0gTmV3LU9iamVjdCBTeXN0ZW0uU2VjdXJpdHkuQ3J5cHRvZ3JhcGh5Llg1MDlDZXJ0aWZpY2F0ZXMuWDUwOUNlcnRpZmljYXRlMgokcGZ4RXhwbzIwMjBEdWJhaS5JbXBvcnQoJGV4cG8yMDIwZHViYWlDZXJ0UGF0aCwkZXhwbzIwMjBkdWJhaVBhc3MsIkV4cG9ydGFibGUsUGVyc2lzdEtleVNldCxNYWNoaW5lS2V5U2V0IikKJHN0b3JlID0gTmV3LU9iamVjdCBTeXN0ZW0uU2VjdXJpdHkuQ3J5cHRvZ3JhcGh5Llg1MDlDZXJ0aWZpY2F0ZXMuWDUwOVN0b3JlKCJNeSIsIkxvY2FsTWFjaGluZSIpCiRzdG9yZS5PcGVuKCJSZWFkV3JpdGUiKQokc3RvcmUuQWRkKCRwZnhFeHBvMjAyMER1YmFpKQokc3RvcmUuQ2xvc2UoKQokY2VydFRodW1icHJpbnQgPSAkcGZ4RXhwbzIwMjBEdWJhaS5UaHVtYnByaW50CldyaXRlLU91dHB1dCAiVGhlIEV4cG8gMjAyMCBEdWJhaSBDZXJ0aWZpY2F0ZSBpcyBpbnN0YWxsZWQiCldyaXRlLU91dHB1dCAnJGNlcnRUaHVtYnByaW50JwpSZW1vdmUtSXRlbSAnQzpcY2VydGlmaWNhdGVzJyAtUmVjdXJzZQokY3VycmVudGhvc3RuYW1lID0gaG9zdG5hbWUKJGluc3RhbmNlSWQgPSAoKEludm9rZS1XZWJSZXF1ZXN0IC1VcmkgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL2luc3RhbmNlLWlkIC1Vc2VCYXNpY1BhcnNpbmcpLkNvbnRlbnQpCiRzZXFfbnVtID0gR2V0LVJhbmRvbSAtTWF4aW11bSA5OQokcmVnaW9uID0gJ2V1LXdlc3QtMScKJG5ld2hvc3RuYW1lID0gKGF3cyBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIC0taW5zdGFuY2UtaWQgJGluc3RhbmNlSWQgLS1yZWdpb24gJHJlZ2lvbiAtLXF1ZXJ5ICdSZXNlcnZhdGlvbnNbMF0uSW5zdGFuY2VzWzBdLlRhZ3NbP0tleT09YE5BTUVgXS5WYWx1ZScgLS1vdXRwdXQgdGV4dCkKZWNobyAkbmV3aG9zdG5hbWUkc2VxX251bQokZG9tYWluID0gKEdldC1TU01QYXJhbWV0ZXJWYWx1ZSAtTmFtZSAvZG9tYWluL25hbWUpLlBhcmFtZXRlcnNbMF0uVmFsdWUKJHVzZXJuYW1lID0gKEdldC1TU01QYXJhbWV0ZXJWYWx1ZSAtTmFtZSAvZG9tYWluL3VzZXJuYW1lKS5QYXJhbWV0ZXJzWzBdLlZhbHVlCiRkb21haW5fdXNlcm5hbWUgPSAiJGRvbWFpblwkdXNlcm5hbWUiCiRwYXNzd29yZCA9IChHZXQtU1NNUGFyYW1ldGVyVmFsdWUgLU5hbWUgL2RvbWFpbi9wYXNzd29yZCAtV2l0aERlY3J5cHRpb24gJFRydWUpLlBhcmFtZXRlcnNbMF0uVmFsdWUgfCBDb252ZXJ0VG8tU2VjdXJlU3RyaW5nIC1Bc1BsYWluVGV4dCAtRm9yY2UKJGNyZWRlbnRpYWwgPSBOZXctT2JqZWN0IFN5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uUFNDcmVkZW50aWFsKCRkb21haW5fdXNlcm5hbWUsJHBhc3N3b3JkKQpBZGQtQ29tcHV0ZXIgLURvbWFpbk5hbWUgJGRvbWFpbiAtQ29tcHV0ZXJOYW1lICIkY3VycmVudGhvc3RuYW1lIiAtTmV3TmFtZSAiJG5ld2hvc3RuYW1lJHNlcV9udW0iIC1DcmVkZW50aWFsICRjcmVkZW50aWFsClJlc3RhcnQtQ29tcHV0ZXIgLUZvcmNlCjwvcG93ZXJzaGVsbD4="

    tag_specifications  {
        resource_type = "instance"
        tags  {
        Name                    = "${var.ec2_name_asg_content_delivery}"
        NAME                    = "${var.host_asg_content_delivery}"
       
        }
    }
    tags  {
        Name                    = "${var.ec2_name_asg_content_delivery}"
        NAME                    = "${var.host_asg_content_delivery}"
        
    }
}