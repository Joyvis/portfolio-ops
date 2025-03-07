terraform {
  required_providers {
    #    required_version = "~> 1.1"
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}

module "portfolioVPC" {
  source = "./modules/vpc"

  vpc_cidr             = local.vpc_cidr
  vpc_tags             = var.vpc_tags
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

module "webserver" {
  source = "./modules/webserver"

  portfolio_vpc_id         = module.portfolioVPC.vpc_id
  portfolio_public_subnets = module.portfolioVPC.public_subnets
}

