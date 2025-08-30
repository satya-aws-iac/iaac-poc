module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment

  # Define public subnets CIDR blocks
  public_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.1.0/24",
    "${var.vpc_cidr_prefix}.2.0/24"
    
  ]

  # Define private subnets CIDR blocks
  private_subnet_cidrs = [
    "${var.vpc_cidr_prefix}.3.0/24",
    "${var.vpc_cidr_prefix}.4.0/24"
  ]

  # Define availability zones
  availability_zones = slice(var.aws_azs, 0, 2)

  tags = merge(
    {
      Name        = var.vpc_name
      Environment = var.environment
      Terraform   = "true"
    },
    var.global_tags
  )
}
