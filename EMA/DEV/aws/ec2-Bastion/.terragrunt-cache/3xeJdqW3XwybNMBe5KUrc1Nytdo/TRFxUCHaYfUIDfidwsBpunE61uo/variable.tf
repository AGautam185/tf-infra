  variable instance_ami {
      type = string
  }

  variable instance_type {
      type = string
  }

  variable key_name {
      type = string 
  }

  variable vpc_security_group_ids {
      type = list(string)
  }

#   variable tags {
#       type = map(string)
#   }
 
 variable "subnet_id" {
    type = string
 }

 variable "create_security_group" {
    type = bool
 }
 
 variable "security_group_description" {
    type = string
 }

 variable "security_group_ingress_rules" {
    type = map(object({
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    description                  = optional(string)
    from_port                    = optional(number)
    ip_protocol                  = optional(string, "tcp")
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
    to_port                      = optional(number)
  }))
 }

 variable "security_group_name" {
    type = string
 }

 variable "security_group_vpc_id" {
    type = string
 }