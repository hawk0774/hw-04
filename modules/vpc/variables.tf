variable "env_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "zone" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "v4_cidr_blocks" {
  type        = string
  description = "CIDR block for the subnet"
}
