# Auto scaling service link role
resource "aws_iam_service_linked_role" "autoscaling" {
  custom_suffix    = "${var.env}-engrsketch"
  aws_service_name = "autoscaling.amazonaws.com"
}
