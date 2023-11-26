# output "public_ip" {
# value       = aws_instance.example.public_ip
# description = "The public IP address of the web server"
# }

output "subnets_ids" {
  value       = data.aws_subnets.default.ids
  description = "The subnets IDs within the default VPC"
}

output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}