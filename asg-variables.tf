# ASG 
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "launch_template" {
  type    = string
  default = "engrsketch-lt"
}
variable "asg_name" {
  type    = string
  default = "engrsketch-asg"
}