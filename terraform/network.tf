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
