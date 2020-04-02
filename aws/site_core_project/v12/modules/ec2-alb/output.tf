output "aws_lb_id" {
  value       = aws_lb.ec2_alb.id
}

output "aws_lb_arn" {
  value       = aws_lb.ec2_alb.arn
}


output "aws_lb_target_group_id" {
  value       = aws_lb_target_group.ec2_tgps.id
}

output "aws_lb_target_group_arn" {
  value       = aws_lb_target_group.ec2_tgps.arn
}



output "aws_lb_target_group_attachment_id" {
  value       = aws_lb_target_group_attachment.ec2_tgps_attach.id
}

output "aws_lb_target_group_attachment_arn" {
  value       = aws_lb_target_group_attachment.ec2_tgps_attach.arn
}