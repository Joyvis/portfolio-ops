variable "vpc_cidr" {
  description = "Classless Inter-Domain Routing for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
  default = {
    Name : "portfolioVPC"
    Project : "Portfolio"
  }
}

variable "availability_zones" {
  description = "Availability Zones for Subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Classless Inter-Domain Routing for Public Subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Classless Inter-Domain Routing for Private Subnets"
  type        = list(string)
}

