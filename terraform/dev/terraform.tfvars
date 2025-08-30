
# Network Configuration
vpc_name        = "dev-vpc"
region          = "us-east-1"
environment     = "dev"
vpc_cidr        = "10.0.0.0/16"
vpc_cidr_prefix = "10.0"
aws_azs         = ["us-east-1a", "us-east-1b","us-east-1c"]

# Resource Naming and Tagging
namespace = "dev"
global_tags = {
  Project     = "iaac-poc"
  Managed_by  = "Terraform"
  Environment = "dev"
  Owner       = "DevOps"
}
