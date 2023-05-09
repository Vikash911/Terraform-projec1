resource "null_resource" "get_ip"{

provisioner "local-exec" {
        command = "echo ${aws_instance.my_ec2[0].public_ip} >> myfile.txt"
                }
}

