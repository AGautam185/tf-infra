include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com-tf-modules:AGautam185/tf-modules.git//aws/vpc?ref=aws-vpc-v1.0"
}

inputs = {
  vpc_name = "DevOps-AkG"
  vpc_cidr = "10.0.0.0/16"
  vpc_azs = ["ap-northeast-3a" , "ap-northeast-3b"]
  vpc_private_subnets = ["10.0.1.0/24"]
  vpc_public_subnets = ["10.0.3.0/24"]
  vpc_create_private_nat_gateway_route = true
  vpc_enable_nat_gateway = true
  vpc_single_nat_gateway = true
}