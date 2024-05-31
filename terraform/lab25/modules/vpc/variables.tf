

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.2.0/24"
}
variable "private2_subnet_cidr" {
  description = "Public subnet CIDR block"
  default     = "10.0.3.0/24"
}
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
