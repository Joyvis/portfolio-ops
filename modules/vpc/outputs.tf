output "vpc_id" {
  value = aws_vpc.portfolioVPC.id
}

output "public_subnets" {
  description = "Webserver Module consumes it to set subnet_ids"
  value = [
    aws_subnet.portfolioPublicSubnet1,
    aws_subnet.portfolioPublicSubnet2
  ]
}

output "private_subnets" {
  description = "RDS Module consumes it to set  subnet_ids"
  value = [
    aws_subnet.portfolioPrivateSubnet1,
    aws_subnet.portfolioPrivateSubnet2
  ]
}
