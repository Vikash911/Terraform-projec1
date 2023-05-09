resource "aws_instance" "my_ec2" {
  count                  = 1
  ami                    = "ami-0c9978668f8d55984"
  instance_type          = "t2.micro"
  subnet_id              = element(aws_subnet.subnets.*.id, count.index)
  availability_zone      = "us-east-1a"
  key_name               = "Window-server"
  vpc_security_group_ids = [aws_security_group.allow_ssh1.id]
  tags = {
    Name = "Ansible"
  }
  depends_on = [aws_vpc.my-vpc, aws_internet_gateway.MyGateway9, aws_subnet.subnets, aws_route_table.RTable, aws_route_table_association.route_asso, aws_security_group.allow_ssh1]
}


