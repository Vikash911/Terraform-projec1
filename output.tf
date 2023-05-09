output "public_ip" {
  value = aws_instance.my_ec2[0].public_ip
}

