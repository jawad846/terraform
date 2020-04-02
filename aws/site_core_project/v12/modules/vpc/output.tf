output "vpc_id" {
    value       = aws_vpc.vpcs.id
}


output "sub_pub_1a" { 
    value       = aws_subnet.sub_pub_1a.id
}
output "sub_pub_1b" { 
    value       =aws_subnet.sub_pub_1b.id
}

output "sub_lb_pub_1a" { 
    value       = aws_subnet.sub_lb_pub_1a.id
}
output "sub_lb_pub_1b" { 
    value       = aws_subnet.sub_lb_pub_1b.id
}

output "sub_app_pvt_1a" { 
    value       = aws_subnet.sub_app_pvt_1a.id
}
output "sub_app_pvt_1b" { 
    value       = aws_subnet.sub_app_pvt_1b.id
}

output "sub_db_pvt_1a" { 
    value       = aws_subnet.sub_db_pvt_1a.id
}
output "sub_db_pvt_1b" { 
    value       = aws_subnet.sub_db_pvt_1b.id
}

output "sub_lb_pvt_1a" { 
    value       = aws_subnet.sub_lb_pvt_1a.id
}
output "sub_lb_pvt_1b" { 
    value       = aws_subnet.sub_lb_pvt_1b.id
}
