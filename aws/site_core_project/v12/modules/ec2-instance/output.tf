output "ec2_instance_id" {
  value       = aws_instance.ec2_instance.id
}


output "launch_template_id" {
  value       = aws_launch_template.ec2_lt.id
}

