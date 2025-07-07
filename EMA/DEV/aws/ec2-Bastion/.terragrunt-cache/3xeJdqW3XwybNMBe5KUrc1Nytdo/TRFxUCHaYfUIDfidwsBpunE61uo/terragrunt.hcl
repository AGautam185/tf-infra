include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../tf-modules/aws/ec2/"
}

# dependency "vpc" {
#   config_path = "../vpc"
#   mock_outputs = {
#           vpc_private_subnets = "vpc-pvt"
#           vpc_public_subnets = "vpc-pub"
#       }
# }

inputs = {
   instance_ami = "ami-0aafffc426e129572"
   instance_type = "t2.micro"
   key_name = "second"
   vpc_security_group_ids = ["sg-01062cefcb177ac13"]
   subnet_id = "subnet-06293034ab3a16dda"
   create_security_group = "true"
   security_group_description = "Bastion Host sg"
   security_group_ingress_rules = {
    ssh = {
      description = "SSH access"
      from_port = 22
      to_port = 22
      ip_protocol = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }
    https = {
      description = "HTTPS access"
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }
   }
   security_group_name = "Bastion Host SG"
   security_group_vpc_id = "vpc-070a91d7cfbb0bea4"
   #tags = local.common_tags
}