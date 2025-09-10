resource "null_resource" "name" {
    depends_on = [ 
        module.ec2_public
     ] //depends on IGW module to provide internet to the bastion host

    connection {
        type = "ssh"
        user = "ec2-user"
        host = aws_eip.bastion_eip.public_ip
        private_key = file("../github/key/terraform-aws.pem")
    }
  
  #file provisioner to copy file from local machine to remote machine
  provisioner "file" {
    source      = "../github/key/terraform-aws.pem"
    destination = "/tmp/terraform-aws.pem"
  }

  #remote-exec provisioner to run commands on remote machine
  provisioner "remote-exec" {
    inline = [
      "chmod 400 /tmp/terraform-aws.pem",
      "sudo mv /tmp/terraform-aws.pem /home/ec2-user/.ssh/terraform-aws.pem",
      "sudo chown ec2-user:ec2-user /home/ec2-user/.ssh/terraform-aws.pem"
    ]
  }

  #local-exec provisioner to run commands on local machine
  provisioner "local-exec" {
    command = "echo Bastion Host is ready on `date` and you can connect using the following command: ssh -i ../github/key/terraform-aws.pem ec2-user@${aws_eip.bastion_eip.public_ip} >> /tmp/bastion-connection.txt"
    working_dir = "local-exec-output-files/"
    //on_failure = continue
  }

# Creation Time Provisioner - By default, provisioners run when a resource is created.
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> /tmp/destroy-time.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
  }
}



