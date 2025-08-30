################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "./modules/vpc"

  # VPC Configuration
  vpc_cidr    = var.vpc_cidr
  environment = var.environment

  # Subnet Configuration
  data_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.6.0/24",
    "${var.vpc_cidr_prefix}.7.0/24"
  ]

  private_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.8.0/24",
    "${var.vpc_cidr_prefix}.9.0/24",
    "${var.vpc_cidr_prefix}.10.0/24"
  ]

  # Subnet Names
  data_subnet_names = [
    "${var.environment}-data-subnet-1",
    "${var.environment}-data-subnet-2"
  ]

  private_subnet_names = [
    "${var.environment}-private-subnet-1",
    "${var.environment}-private-subnet-2",
    "${var.environment}-private-subnet-3"
  ]

  # Availability Zones
  availability_zones = slice(var.aws_azs, 0, 3)

  # Resource Tags
  tags = merge(
    {
      Name        = var.vpc_name
      Environment = var.environment
      Terraform   = "true"
    },
    var.global_tags
  )
}