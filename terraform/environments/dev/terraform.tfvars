################################################################################
# Development Environment Variables
################################################################################

# Network Configuration
vpc_name        = "dev-vpc"
region          = "us-east-1"
environment     = "dev"
vpc_cidr        = "10.0.0.0/16"

# Availability Zones
aws_azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Subnet Configuration
private_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

data_subnet_cidrs = [
  "10.0.4.0/24",
  "10.0.5.0/24",
  "10.0.6.0/24"
]

# Subnet Names
private_subnet_names = [
  "dev-private-subnet-1",
  "dev-private-subnet-2",
  "dev-private-subnet-3"
]

data_subnet_names = [
  "dev-data-subnet-1",
  "dev-data-subnet-2",
  "dev-data-subnet-3"
]

# Resource Naming and Tagging
namespace = "dev"
global_tags = {
  Project     = "iaac-poc"
  Managed_by  = "Terraform"
  Environment = "dev"
  Owner       = "DevOps"
}
