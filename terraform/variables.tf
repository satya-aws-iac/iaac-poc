variable "namespace" {
  description = "The namespace for all resources"
  type        = string

}

variable "global_tags" {
  description = "A map of tags to apply to all resources"
  type        = map(any)
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
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "aws_azs" {
  description = "A list of availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
