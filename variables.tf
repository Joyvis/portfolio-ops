variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
  default = {
    Name : "portfolioVPC"
    Project : "Portfolio"
  }
}
