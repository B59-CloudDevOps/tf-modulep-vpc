resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${local.name_tag_prefix}-igw"
  }
}