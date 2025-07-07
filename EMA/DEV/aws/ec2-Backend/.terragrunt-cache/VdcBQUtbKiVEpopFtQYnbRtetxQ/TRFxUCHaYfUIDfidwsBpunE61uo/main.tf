module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.1"
  
  ami = var.instance_ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  # key_name = var.key_name
  # vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  create_security_group = var.create_security_group
  security_group_description = var.security_group_description
  security_group_ingress_rules = var.security_group_ingress_rules
  security_group_name = var.security_group_name
  security_group_vpc_id = var.security_group_vpc_id
  tags = var.tags
}