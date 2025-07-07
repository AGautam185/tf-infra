module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"
  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets = var.vpc_public_subnets
  create_private_nat_gateway_route = var.vpc_create_private_nat_gateway_route
  enable_nat_gateway = true
  single_nat_gateway = true
  # tags = var.vpc_tags
}