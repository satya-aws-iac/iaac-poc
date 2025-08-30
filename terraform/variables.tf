variable "namespace" {
  description = "The namespace for all resources"
  type        = string
  default     = "default"
}

variable "global_tags" {
  description = "A map of tags to apply to all resources"
  type        = map(any)
  default     = {}
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}


variable "region_secondary" {
  description = "The secondary AWS region to deploy resources in"
  type        = string
  default     = "us-east-2"
}

# Variables for VPC

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "dev-vpc"
}



variable "aws_azs" {
  description = "A list of availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr_prefix" {
  description = "CIDR prefix for subnets (e.g., 10.0 for a VPC with CIDR 10.0.0.0/16)"
  type        = string
  default     = "10.0"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}