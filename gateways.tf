# Internet Gateway for the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${local.name_tag_prefix}-igw"
  }
}

# Reserves an Elastic IP for the NAT Gateway
resource "aws_eip" "main" {
  domain = "vpc"
  tags = {
    Name = "roboshop-${local.name_tag_prefix}-nat-eip"
  }
}

# Provisions a NAT Gateway in the public subnet
resource "aws_nat_gateway" "main" {
  depends_on = [aws_eip.main]

  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.web.*.id[0]

  tags = {
    Name = "roboshop-${local.name_tag_prefix}-nat-gw"
  }
}