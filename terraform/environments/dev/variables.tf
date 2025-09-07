################################################################################
# Input Variables
################################################################################

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "aws_azs" {
  description = "List of AWS Availability Zones"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "data_subnet_cidrs" {
  description = "List of data subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_names" {
  description = "List of private subnet names"
  type        = list(string)
}

variable "data_subnet_names" {
  description = "List of data subnet names"
  type        = list(string)
}

variable "namespace" {
  description = "Namespace for resource naming"
  type        = string
}

variable "global_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
