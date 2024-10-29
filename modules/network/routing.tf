resource "aws_route_table" "test-public-rt" {
  vpc_id = aws_vpc.test-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }
  tags = {
    Name = "${var.vpc_name}-public-RT"
    Env  = var.environment
  }
}

resource "aws_route_table_association" "test-public-rt-association" {
  count          = length(var.public_subnet_cidrs)
  route_table_id = aws_route_table.test-public-rt.id
  subnet_id      = aws_subnet.test-public-subnet[count.index].id
}

resource "aws_route_table" "test-private-rt" {
  vpc_id = aws_vpc.test-vpc.id
#   count  = length(var.private_subnet_cidrs)
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }
  tags = {
    Name = "${var.vpc_name}-private-RT"
    Env  = var.environment
  }
}

resource "aws_route_table_association" "test-private-rt-association" {
  count          = length(var.private_subnet_cidrs)
  route_table_id = aws_route_table.test-private-rt.id
  subnet_id      = aws_subnet.test-private-subnet[count.index].id
}