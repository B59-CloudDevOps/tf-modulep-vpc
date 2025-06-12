resource "aws_route" "default_vpc" {
  route_table_id            = var.default_vpc_rt
  destination_cidr_block    = var.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

# resource "aws_route" "main" {
#   route_table_id            = aws
#   destination_cidr_block    = var.vpc_cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.main.id
# }

resource "aws_route_table" "web" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${local.web_subnet_tags}-route-table"
  }
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.main.id
  # }

  tags = {
    Name = "${local.app_subnet_tags}-route-table"
  }
}

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "${local.db_subnet_tags}-route-table"
  }
}
