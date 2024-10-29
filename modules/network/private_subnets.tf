resource "aws_subnet" "test-private-subnet" {
  vpc_id                  = aws_vpc.test-vpc.id
  count                   = length(var.private_subnet_cidrs)
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.private_availability_zones[count.index]
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Env  = var.environment
  }
}