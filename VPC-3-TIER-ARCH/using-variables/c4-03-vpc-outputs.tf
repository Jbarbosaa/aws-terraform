# VPC Outputs Values

#VPC_ID

output "vpc_id" {
    description = "The ID of the VPC"
    value       = module.vpc.vpc_id
}

#VPC CIDR Block
output "vpc_cidr_block" {
    description = "The CIDR block of the VPC"
    value       = module.vpc.vpc_cidr_block
}

#Public Subnets
output "vpc_public_subnets" {
    description = "The Public Subnets of the VPC"
    value       = module.vpc.public_subnets
}
#Private Subnets
output "vpc_private_subnets" {
    description = "The Private Subnets of the VPC"
    value       = module.vpc.private_subnets
}
#Database Subnets
output "vpc_database_subnets" {
    description = "The Database Subnets of the VPC"
    value       = module.vpc.database_subnets
}
#NAT Gateway IDs
output "vpc_nat_gateway_ids" {
    description = "The NAT Gateway IDs of the VPC"
    value       = module.vpc.nat_gateway_ids
}

#NAT Gateway IPs
output "vpc_nat_gateway_ips" {
    description = "The NAT Gateway IPs of the VPC"
    value       = module.vpc.nat_gateway_ips
}

#VPC AZs
output "vpc_azs" {
    description = "The Availability Zones of the VPC"
    value       = module.vpc.azs
}