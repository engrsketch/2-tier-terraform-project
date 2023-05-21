variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

# Tags
variable "tags" {
  type = map(string)
  default = {
    Owner       = "Janes"
    Environment = "Dev"
  }
}

# # VPC variable
# variable "vpc_name" {
#   description = "Name of VPC"
#   type        = string
#   default     = "Janes-vpc"
# }
# variable "vpc_cidr" {
#   type    = string
#   default = "10.0.0.0/16"
# }
# variable "private_subnets" {
#   type    = list(string)
#   default = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
# }
# variable "public_subnets" {
#   type    = list(string)
#   default = ["10.0.82.0/24", "10.0.83.0/24", "10.0.84.0/24"]
# }

# # Security group variables
# variable "alb_sg_name" {
#   type    = string
#   default = "ALB_security-group"
# }
# variable "internet" {
#   type    = list(string)
#   default = ["0.0.0.0/0"]
# }
# variable "ingress_rules" {
#   type    = list(string)
#   default = ["http-80-tcp"]
# }
# variable "instance_sg_name" {
#   type    = string
#   default = "Instance_security-group"
# }


# # ASG 
# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }
# variable "launch_template" {
#   type    = string
#   default = "Janes-lt"
# }
# variable "asg_name" {
#   type    = string
#   default = "Janes-asg"
# }