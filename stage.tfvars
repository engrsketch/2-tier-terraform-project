env = "stage"
vpc_cidr = "10.0.0.0/16"
private_subnets = ["10.0.16.0/24", "10.0.17.0/24", "10.0.18.0/24"]
public_subnets = [ "10.0.92.0/24", "10.0.93.0/24", "10.0.94.0/24"]
tags = {
  Owner       = "engrsketch"
  Environment = "Stage"
}