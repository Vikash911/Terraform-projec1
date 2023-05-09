# VPC Create
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "myvpc9"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "MyGateway9" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "Mygateway9"
  }
  depends_on = [aws_vpc.my-vpc]
}

# SUBNET

resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = element(var.subnet_cidr, count.index)
  availability_zone       = element(var.AZ-name, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-${count.index + 1}"
  }
  depends_on = [aws_vpc.my-vpc, aws_internet_gateway.MyGateway9]
}


# Route Table 
resource "aws_route_table" "RTable" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyGateway9.id
  }


  tags = {
    Name = "MyROute1"
  }
  depends_on = [aws_vpc.my-vpc, aws_internet_gateway.MyGateway9, aws_subnet.subnets]
}

# Route Table subnet association 
resource "aws_route_table_association" "route_asso" {
  count          = length(var.subnet_cidr)
  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = aws_route_table.RTable.id

  depends_on = [aws_vpc.my-vpc, aws_internet_gateway.MyGateway9, aws_subnet.subnets, aws_route_table.RTable]
}
