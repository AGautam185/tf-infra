variable "vpc_name" {
    type = string
    description = "the name of the vpc"
}

variable "vpc_cidr" {
    type = string
    description = "the cidr block of the vpc"
}

variable "vpc_azs" {
    type = list(string)
    description = "the availability zones of the vpc"
}

variable "vpc_private_subnets" {
    type = list(string)
    description = "the private subnets of the vpc"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
    type = list(string)
    description = "the public subnets of the vpc"
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "vpc_create_private_nat_gateway_route" {
    type = bool
    description = "whether to create a private nat gateway route"
    default = true
}

variable "vpc_enable_nat_gateway" {
    type = bool
    description = "whether to enable nat gateway"
    default = true
}

variable "vpc_single_nat_gateway" {
    type = bool
    description = "whether to use a single nat gateway"
    default = true
}


# variable "vpc_tags" {
#     type = map(string)
#     description = "the tags of the vpc"
# }



