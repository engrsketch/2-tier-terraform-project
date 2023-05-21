# VPC variable
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "Janes-vpc"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
}
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.82.0/24", "10.0.83.0/24", "10.0.84.0/24"]
}