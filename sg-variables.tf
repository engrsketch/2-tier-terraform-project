# Security group variables
variable "alb_sg_name" {
  type    = string
  default = "ALB_security-group"
}
variable "internet" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "ingress_rules" {
  type    = list(string)
  default = ["http-80-tcp"]
}
variable "instance_sg_name" {
  type    = string
  default = "Instance_security-group"
}
