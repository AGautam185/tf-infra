include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  project_vars = (read_terragrunt_config(find_in_parent_folders("project-vars.hcl"))).locals
  global_vars = (read_terragrunt_config(find_in_parent_folders("global-vars.hcl"))).locals
  merged_tags = merge(local.project_vars.common_tags, local.global_vars.common_tags)
}

terraform {
  source = "../../../../../tf-modules/aws/ec2/"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
          private_subnets = ["vpc-pvt"]
          public_subnets = ["vpc-pub"]
          vpc_cidr_block = "10.0.0.0/16"
          vpc_id = "vpc-id-xyz"
      }
}

inputs = {
   instance_ami = "ami-0aafffc426e129572"
   instance_type = "t2.micro"
  #  key_name = "second"
  #  vpc_security_group_ids = ["sg-01062cefcb177ac13"]
   subnet_id = dependency.vpc.outputs.private_subnets[0]
   create_security_group = "true"
   security_group_description = "Frontend Host sg"
   security_group_ingress_rules = {
    VPC_Range = {
      description = "Allow traffic from VPC CIDR"
      ip_protocol = "-1"
      cidr_ipv4 = dependency.vpc.outputs.vpc_cidr_block
    }
   }
   security_group_name = "Frontend Host SG"
   security_group_vpc_id = dependency.vpc.outputs.vpc_id
   tags = local.merged_tags
}