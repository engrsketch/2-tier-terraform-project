
# Application LoadBalancer
module "engrsketch_alb" {
  source                = "terraform-aws-modules/alb/aws"
  version               = "8.6.0"
  name                  = "${var.env}-engrsketch-alb"
  load_balancer_type    = "application"
  vpc_id                = module.engrsketch_vpc.vpc_id
  subnets               = module.engrsketch_vpc.public_subnets
  create_security_group = false
  security_groups       = [module.ALB_security_group.security_group_id]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
  target_groups = [
    {
      name_prefix                       = "engrsketch-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 60
      load_balancing_cross_zone_enabled = true
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200"
      }
      protocol_version = "HTTP1"
      tags = "${var.tags}"
    }
  ]
}