#AWS EC2 Instance Terraform Outputs
#Public EC2 Instance - Bastion Host

output "bastion_instance_ids" {
    description = "Public EC2 Instance IDs"
    value       = module.ec2-instance.*.ids
}

#EC2 Bastion Host Public IPs
output "bastion_instance_public_ips" {
    description = "Public EC2 Instance Public IPs"
    value       = module.ec2-public.*.public_ip
}

#Private EC2 Instances IDs
output "private_instance_ids" {
    description = "Private EC2 Instance IDs"
    value       = module.ec2-public_private.*.ids
}

#Private EC2 Instances Private IPs
output "private_instance_private_ips" {
    description = "Private EC2 Instance Private IPs"
    value       = module.ec2-private.*.private_ip
}

#Private EC2 Instances Public IPs
output "private_instance_public_ips" {
    description = "Private EC2 Instance Public IPs"
    value       = [for ip in module.ec2-private.*.public_ip : ip != null]
}