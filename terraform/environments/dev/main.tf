################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../../modules/vpc"

  # VPC Configuration
  vpc_name    = var.vpc_name
  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  # Availability Zones
  availability_zones = var.aws_azs

  # Subnet Configuration
  private_subnet_cidrs = var.private_subnet_cidrs
  data_subnet_cidrs    = var.data_subnet_cidrs

  # Subnet Names
  private_subnet_names = var.private_subnet_names
  data_subnet_names    = var.data_subnet_names

  # Tags
  tags = var.global_tags
}
