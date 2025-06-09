resource "aws_subnet" "web" {
  count      = length(var.web_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web_subnet_cidr_block[count.index]

  tags = local.web_subnet_tags
}