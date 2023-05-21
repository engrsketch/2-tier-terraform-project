# Auto scaling group
module "autoscaling" {
  source                      = "terraform-aws-modules/autoscaling/aws"
  version                     = "6.9.0"
  name                        = var.asg_name
  min_size                    = 2
  max_size                    = 5
  desired_capacity            = 3
  health_check_grace_period   = 300
  wait_for_capacity_timeout   = 0
  health_check_type           = "ELB"
  security_groups             = [module.ASG_security_group.security_group_id]
  vpc_zone_identifier         = module.engrsketch_vpc.private_subnets
  service_linked_role_arn     = aws_iam_service_linked_role.autoscaling.arn
  target_group_arns           = module.engrsketch_alb.target_group_arns
  enable_monitoring           = true
  launch_template_name        = var.launch_template
  launch_template_description = "EC2 auto scaling launch template"
  update_default_version      = true
  image_id                    = data.aws_ami.amzlinux2023.id
  instance_type               = var.instance_type
  user_data                   = base64encode(file("nginx.sh"))
  create_iam_instance_profile = true
  iam_role_name               = "engrsketch"
  iam_role_path               = "/ec2/"
  iam_role_description        = "EC2 role for SSM"
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    #AmazonEC2RoleforSSM          = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  }
  block_device_mappings = [
    {
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
        kms_key_id            = module.engrsketch_kms_key.key_arn
      }
    }
  ]
  scaling_policies = {
    avg_cpu_above_65 = {
      policy_type               = "TargetTrackingScaling"
      estimated_instance_warmup = 120
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 65.0
      }
    }
  }
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 32
    instance_metadata_tags      = "enabled"
  }
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      # checkpoint_delay       = 60
      # checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 60
      min_healthy_percentage = 50
    }
    triggers = ["tag", "launch_template"]
  }
}