terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.50.0"
    }
  }

  required_version = ">= 1.7.5"

  backend "s3" {
    bucket         = "terraform-state-backet"
    key            = "terraform/state"
    region         = var.region
    profile        = "cli-user"
  }
}