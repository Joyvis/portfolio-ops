resource "aws_vpc" "portfolioVPC" {
  instance_tenancy = "default"
  cidr_block       = var.vpc_cidr
  tags             = var.vpc_tags
}

resource "aws_internet_gateway" "portfolioIGW" {
  vpc_id = aws_vpc.portfolioVPC.id
  tags = {
    Name    = "portfolioIGW"
    Project = "Portfolio"
  }
}

resource "aws_eip" "portfolioNatGatewayEIP1" {
  tags = {
    Name    = "portfolioNatGatewayEPI1"
    Project = "Portfolio"
  }
}

resource "aws_nat_gateway" "portfolioNatGateway1" {
  allocation_id = aws_eip.portfolioNatGatewayEIP1.id
  subnet_id     = aws_subnet.portfolioPublicSubnet1.id
  tags = {
    Name    = "portfolioNatGateway1"
    Project = "Portfolio"
  }
}

resource "aws_subnet" "portfolioPublicSubnet1" {
  vpc_id            = aws_vpc.portfolioVPC.id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name    = "portfolioPublicSubnet1"
    Project = "Portfolio"
  }
}

resource "aws_eip" "portfolioNatGatewayEIP2" {
  tags = {
    Name    = "portfolioNatGatewayEPI2"
    Project = "Portfolio"
  }
}

resource "aws_nat_gateway" "portfolioNatGateway2" {
  allocation_id = aws_eip.portfolioNatGatewayEIP2.id
  subnet_id     = aws_subnet.portfolioPublicSubnet2.id
  tags = {
    Name    = "portfolioNatGateway2"
    Project = "Portfolio"
  }
}

resource "aws_subnet" "portfolioPublicSubnet2" {
  vpc_id            = aws_vpc.portfolioVPC.id
  cidr_block        = var.public_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name    = "portfolioPublicSubnet2"
    Project = "Portfolio"
  }
}

resource "aws_subnet" "portfolioPrivateSubnet1" {
  vpc_id            = aws_vpc.portfolioVPC.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name    = "portfolioPrivateSubnet1"
    Project = "Portfolio"
  }
}

resource "aws_subnet" "portfolioPrivateSubnet2" {
  vpc_id            = aws_vpc.portfolioVPC.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name    = "portfolioPrivateSubnet2"
    Project = "Portfolio"
  }
}

resource "aws_route_table" "portfolioPublicRT" {
  vpc_id = aws_vpc.portfolioVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.portfolioIGW.id
  }
  tags = {
    Name    = "portfolioPublicRT"
    Project = "Portfolio"
  }
}

resource "aws_route_table" "portfolioPrivateRT1" {
  vpc_id = aws_vpc.portfolioVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.portfolioIGW.id
  }
  tags = {
    Name    = "portfolioPrivateRT1"
    Project = "Portfolio"
  }
}

resource "aws_route_table_association" "portfolioPublicTRassociation1" {
  subnet_id      = aws_subnet.portfolioPublicSubnet1.id
  route_table_id = aws_route_table.portfolioPublicRT.id
}

resource "aws_route_table_association" "portfolioPublicTRassociation2" {
  subnet_id      = aws_subnet.portfolioPublicSubnet2.id
  route_table_id = aws_route_table.portfolioPublicRT.id
}

