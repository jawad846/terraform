output "policy_arn" {
  value       = aws_iam_policy.iam_policy.arn
}

output "iam_role_name" {
  value       = aws_iam_role.iam_role.name
}
