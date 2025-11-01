aws_region         = "us-west-1"
vpc_name           = "production-vpc"
availability_zones = ["us-west-1a", "us-west-1b", "us-west-1c"]

vpc_cidr = "10.0.0.0/16"

# Public subnets - one per AZ
public_subnet_cidrs = [
  "10.0.1.0/24", # us-west-1a
  "10.0.2.0/24", # us-west-1b
  "10.0.3.0/24"  # us-west-1c
]

# Private subnets - one per AZ
private_subnet_cidrs = [
  "10.0.11.0/24", # us-west-1a
  "10.0.12.0/24", # us-west-1b
  "10.0.13.0/24"  # us-west-1c
]

# Enable NAT Gateway for private subnets
enable_nat_gateway = true
single_nat_gateway = true # Use single NAT Gateway to save costs

tags = {
  Environment = "Production"
  Terraform   = "true"
  Project     = "iaac-poc"
}