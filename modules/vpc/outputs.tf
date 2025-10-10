output "network_id" {
  description = "ID of the created VPC network"
  value       = yandex_vpc_network.network.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = yandex_vpc_subnet.subnet.id
}

output "subnet_name" {
  description = "Name of the created subnet"
  value       = yandex_vpc_subnet.subnet.name
}

output "subnet_zone" {
  description = "Zone of the created subnet"
  value       = yandex_vpc_subnet.subnet.zone
}

output "subnet_cidr" {
  description = "CIDR block of the created subnet"
  value       = yandex_vpc_subnet.subnet.v4_cidr_blocks
}
