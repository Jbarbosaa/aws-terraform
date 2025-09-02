# Datasource
data "aws_availability_zones" "myazones" {
    state = "available"
    filter {
        name = "opt-in-status"
        values = ["opt-in-not-required"] 
    }     
}

#Datasource-2
data "aws_ec2_instance_type_offerings" "my_inst_type" {
    for_each = toset([data.aws_availability_zones.my_azones.names])
    filter {
        name = "instance-type"
        values = ["t3.micro"]
    }
    
    filter {
        name = "location"
        values = [each.key]
    }

    location_type = "availability-zone"
}

# Basic Output
output "instance_types_by_az" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: az => details.instance_type
    }
}

output "available_instance_types" {
    description = "Instance types available per AZ, excluding empty results"
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: az => details.instance_type if length(details.instance_type) != 0
    }
}
output "available_az_keys" {
    description = "Lists availability zones with non-empty instance types"
    value = keys({
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: az => details.instance_type if length(details.instance_type) != 0
    })
}


