variable "author" {
  description = "Author name"
  type        = string
  default     = "hung.dinh"
}

variable "keyname" {
  description = "SSH key to access ec2 instance"
  type        = string
  default     = "hung.dinh"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr" {
  description = "Public CIDR Block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_cidr" {
  description = "Private CIDR Block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "svmc_cidr" {
  description = "SVMC CIDR Block"
  type        = string
  default     = "112.78.3.236/32"
}

variable "ami_id" {
  description = "AMI Ubuntu 20.04 LTS"
  type        = string
  default     = "ami-04505e74c0741db8d"
}