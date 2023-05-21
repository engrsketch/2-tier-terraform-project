
# VPC resources
module "janes_vpc" {
  source                               = "terraform-aws-modules/vpc/aws"
  version                              = "4.0.1"
  name                                 = var.vpc_name
  cidr                                 = var.vpc_cidr
  azs                                  = data.aws_availability_zones.myazs.names
  private_subnets                      = var.private_subnets
  public_subnets                       = var.public_subnets
  enable_nat_gateway                   = true
  single_nat_gateway                   = true
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  map_public_ip_on_launch              = true
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60
  public_subnet_tags = {
    type = "Public-Subnet"
  }
  private_subnet_tags = {
    type = "Private_Subnet"
  }
  tags = var.tags
}
