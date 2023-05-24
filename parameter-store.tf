resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.env}/vpcID"
  type  = "String"
  value = module.engrsketch_vpc.vpc_id
}