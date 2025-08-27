# Terraform Output values

# EC2 Instance Public IP

output "insance_publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.myec2vm.public_ip
  
}

#EC2 Instance Public DNS

output "insance_publicdns" {
    description = "EC2 Instance Public IDNS"
    value = aws_instance.myec2vm.public_dns
}