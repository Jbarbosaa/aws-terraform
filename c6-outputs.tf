# Terraform Output values

# EC2 Instance Public IP with TOSET

output "instance_publicip" {
    description = "EC2 Instance Public IP"
    value = toset ([
        for myec2vm in aws_instance.myec2vm : myec2vm.public_ip
    ])
  
}

#EC2 Instance Public DNS with TOSET 

output "instance_publicdns" {
    description = "EC2 Instance Public IDNS"
    value = toset ([
        for myec2vm in aws_instance.myec2vm : myec2vm.public_dns
    ])
}

#Output - For Loop with List

output "for_output_list" {
    description = "For loop with List"
    value = [for instance in aws_instance.myec2vm: instance_publicdns]
  
}

#Output - For loop with map

output "for_output_map1" {
    description = "For loop with map"
    value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

#Output - For loop with Map Advanced
output "for_output_map2" {
    description = "For loop with Map - Advanced"
    value = {for c, instance in aws_aws_instance.myec2vm: c => instance_publicdns}
  
}