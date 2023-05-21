output "myazs" {
  value = data.aws_availability_zones.myazs.names
}

# VPC module Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.janes_vpc.vpc_id
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.janes_vpc.vpc_cidr_block
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.janes_vpc.private_subnets
}
output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.janes_vpc.private_subnets_cidr_blocks
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.janes_vpc.public_subnets
}
output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.janes_vpc.public_subnets_cidr_blocks
}
# KMS module Outputs
output "janes_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.janes_kms_key.key_arn
}
output "janes_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.janes_kms_key.key_id
}

# Auto scaling service link role output
output "asg_role" {
  value = aws_iam_service_linked_role.autoscaling.arn
}
# Security group modul Outputs
output "ALB_security_group_id" {
  description = "The ID of the security group"
  value       = module.ALB_security_group.security_group_id
}
output "ASG_security_group_id" {
  description = "The ID of the security group"
  value       = module.ASG_security_group.security_group_id
}

# ALB module Outputs
output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.janes_alb.lb_dns_name
}
output "target_group_arns" {
  description = "ARNs of the target groups."
  value       = module.janes_alb.target_group_arns
}
output "target_group_names" {
  description = "Name of the target group."
  value       = module.janes_alb.target_group_names
}

# Auto scaling module outputs
output "launch_template_id" {
  description = "The ID of the launch template"
  value       = module.autoscaling.launch_template_id
}
output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = module.autoscaling.launch_template_arn
}
output "launch_template_name" {
  description = "The name of the launch template"
  value       = module.autoscaling.launch_template_name
}
output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = module.autoscaling.launch_template_latest_version
}

output "public_nacl_id" {
  description = "Public NACL id"
  value       = aws_network_acl.public_nacl.id
}
output "private_nacl_id" {
  description = "Public NACL id"
  value       = aws_network_acl.private_nacl.id
}

