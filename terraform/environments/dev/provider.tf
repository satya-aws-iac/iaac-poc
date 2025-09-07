################################################################################
# Terraform Configuration
################################################################################

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

################################################################################
# Provider Configuration
################################################################################

provider "aws" {
  region = var.region

  default_tags {
    tags = var.global_tags
  }
}
