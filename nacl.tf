# Public NACL 
resource "aws_network_acl" "public_nacl" {
  vpc_id     = module.engrsketch_vpc.vpc_id
  subnet_ids = module.engrsketch_vpc.public_subnets
  tags       = var.tags
}
# Public NACL ingress rules
resource "aws_network_acl_rule" "public_fromvpc" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl_rule" "public_http" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 120
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 80
  to_port        = 80
}
resource "aws_network_acl_rule" "public_https" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 130
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 443
  to_port        = 443
}
resource "aws_network_acl_rule" "public_ephem" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 140
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 1024
  to_port        = 65535
}
# Public NACL egress rules 
resource "aws_network_acl_rule" "public_egress_fromvpc" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl_rule" "public_egress_http" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 120
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 80
  to_port        = 80
}
resource "aws_network_acl_rule" "public_egress_https" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 130
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 443
  to_port        = 443
}
resource "aws_network_acl_rule" "public_egress_ephem" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 140
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 1024
  to_port        = 65535
}
# Private NACL
resource "aws_network_acl" "private_nacl" {
  vpc_id     = module.engrsketch_vpc.vpc_id
  subnet_ids = module.engrsketch_vpc.private_subnets
  tags       = var.tags
}
# Private NACL ingress rules
resource "aws_network_acl_rule" "private_ingress_fromvpc" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl_rule" "private_ingress_ephem" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 120
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 1024
  to_port        = 65535
}
# Private NACL egress rules 
resource "aws_network_acl_rule" "private_egress_fromvpc" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}
resource "aws_network_acl_rule" "private_egress_http" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 120
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 80
  to_port        = 80
}
resource "aws_network_acl_rule" "private_egress_https" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 130
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 443
  to_port        = 443
}
resource "aws_network_acl_rule" "private_egress_ephem" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 140
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.internet[0]
  from_port      = 1024
  to_port        = 65535
}