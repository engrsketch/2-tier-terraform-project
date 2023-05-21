# Auto scaling service link role
resource "aws_iam_service_linked_role" "autoscaling" {
  custom_suffix    = "janes"
  aws_service_name = "autoscaling.amazonaws.com"
}