env = "dev"
vpc_cidr = "10.1.0.0/16"
private_subnets = ["10.1.6.0/24", "10.1.7.0/24", "10.1.8.0/24"]
public_subnets = [ "10.1.82.0/24", "10.1.83.0/24", "10.1.84.0/24"]
tags = {
  Owner       = "engrsketch"
  Environment = "Dev"
}