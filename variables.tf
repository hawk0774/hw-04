variable "ssh_public_key" {
  description = "SSH public key for cloud-init (as a list)"
  type        = list(string)
  default     = ["ssh-ed25519 *"]
}

variable "cloud_id" {
  type        = string
  default     = "*"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "*"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "username" {
  description = "Username for VM"
  type        = string
  default     = "ubuntu"
}

variable "packages" {
  description = "List of packages to install"
  type        = list(string)
  default     = ["nginx"]
}


variable "env_name" {
  type        = string
  default     = "develop"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "instance_one_name" {
  type        = string
  description = "Name of the marketing VM instance"
  default     = "marketing-vm"
}

variable "instance_two_name" {
  type        = string
  description = "Name of the analytics VM instance"
  default     = "analytics-vm"
}


