
# KMS key for EBS encryption
module "janes_kms_key" {
  source                            = "terraform-aws-modules/kms/aws"
  version                           = "1.5.0"
  description                       = "EC2 AutoScaling key usage"
  key_usage                         = "ENCRYPT_DECRYPT"
  key_users                         = [data.aws_caller_identity.current.arn]
  key_administrators                = [data.aws_caller_identity.current.arn]
  key_service_roles_for_autoscaling = [aws_iam_service_linked_role.autoscaling.arn]
  aliases                           = ["Janes-ebs"]
  tags                              = var.tags
}