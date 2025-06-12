resource "aws_subnet" "web" {
  count                   = length(var.web_subnet_cidr_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_cidr_block[count.index]
  availability_zone_id    = var.az[count.index]
  map_public_ip_on_launch = true
  # Ensure that the web subnet is public by enabling public IPs on launch
  tags = local.web_subnet_tags
}

resource "aws_subnet" "app" {
  count                = length(var.app_subnet_cidr_block)
  vpc_id               = aws_vpc.main.id
  cidr_block           = var.app_subnet_cidr_block[count.index]
  availability_zone_id = var.az[count.index]

  tags = local.app_subnet_tags
}

resource "aws_subnet" "db" {
  count                = length(var.db_subnet_cidr_block)
  vpc_id               = aws_vpc.main.id
  cidr_block           = var.db_subnet_cidr_block[count.index]
  availability_zone_id = var.az[count.index]

  tags = local.db_subnet_tags
}