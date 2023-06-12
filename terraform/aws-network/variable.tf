
################################################################################
# VPC
################################################################################
variable "public_subnet" {
  type = map(any)
}


variable "description" {
  type = string
}

variable "ports_sec" {
  type = list(any)
}

variable "protocol" {
  type = string
}

variable "cidr_world" {
}

variable "cidr_blocks" {
  type = list(any)
}

variable "cidr_block" {
}

variable "name_sec" {
  type = string
}

variable "name" {
  type = string
}

variable "from_port_egress" {
  type = number
}

variable "to_port_egress" {
  type = number
}

variable "protocol_egress" {
}


