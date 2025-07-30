module "iam" {
  source = "./modules/iam"
  
  # Pass any required variables
  # variable1 = var.variable1
}

module "vpc" {
  source = "./modules/vpc"
  
  # Pass any required variables
  # variable1 = var.variable1
}