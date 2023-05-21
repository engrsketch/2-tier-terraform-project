# Terraform Block
terraform {
  required_version = "~> 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }
  # Adding Backend as s3 for remote state storage
  backend "s3" {
    bucket = "terraform-state-engrsketch"
    key    = "engrsketch/terraform.tfstate"
    region = "eu-west-2"
    # DynamoDB for state locking
    dynamodb_table = "state-table-engrsketch"
  }
}

provider "aws" {
  region = var.aws_region
  #profile = "engrsketch"
}