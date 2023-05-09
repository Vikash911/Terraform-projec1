resource "aws_security_group" "allow_ssh1" {
  name        = "tf_allow_ssh1"
  description = "Allow traffic"
  vpc_id      = aws_vpc.my-vpc.id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      description = "ssh from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_ssh1"
  }
  depends_on = [aws_vpc.my-vpc, aws_internet_gateway.MyGateway9, aws_subnet.subnets, aws_route_table.RTable]
}
