variable "region" {
  default = "us-east-1"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "public_cidr" {
  default = "10.0.1.0/24"

}
variable "private_cidr" {
  default = "10.0.2.0/24"

}
variable "allocated_storage" {
  description = "The amount of allocated storage."
  type        = number
  default = 20
}

variable "engine" {
  description = "The database engine to use."
  type        = string
  default = "mysql"
}

variable "instance_class" {
  description = "The instance class to use."
  type        = string
  default = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database."
  type        = string
  default = "mydbivolve"
}

variable "username" {
  description = "The username for the database."
  type        = string
  default = "admin"
}

variable "password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
  
}
