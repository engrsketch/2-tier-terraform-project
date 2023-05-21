# Security groups
module "ALB_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.17.2"
  description         = "ALB security group that allows inbound HTTP traffic from internet"
  name                = var.alb_sg_name
  vpc_id              = module.janes_vpc.vpc_id
  ingress_rules       = var.ingress_rules
  ingress_cidr_blocks = var.internet
  egress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.ASG_security_group.security_group_id
    }
  ]
}
module "ASG_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "4.17.2"
  description = "ASG security group that allows HTTP traffic from the ALB"
  name        = var.instance_sg_name
  vpc_id      = module.janes_vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.ALB_security_group.security_group_id
    }
  ]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = var.internet
}
