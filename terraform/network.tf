################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "./modules/vpc"

  # VPC Configuration
  vpc_cidr    = var.vpc_cidr
  environment = var.environment

  # Subnet Configuration
  public_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.1.0/24",
    "${var.vpc_cidr_prefix}.2.0/24"
  ]

  private_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.3.0/24",
    "${var.vpc_cidr_prefix}.4.0/24"
  ]

  # Availability Zones
  availability_zones = slice(var.aws_azs, 0, 2)

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
