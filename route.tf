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
    Name = "${local.name_tag_prefix}-web-route-table"
  }
}

resource "aws_route_table_association" "web" {
  count          = length(var.aws_subnet.web.*.id)
  subnet_id      = aws_subnet.web.*.id[count.index]
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.main.id
  # }

  tags = {
    Name = "${local.name_tag_prefix}-app-route-table"
  }
}

resource "aws_route_table_association" "app" {
  count          = length(var.aws_subnet.app.*.id)
  subnet_id      = aws_subnet.app.*.id[count.index]
  route_table_id = aws_route_table.app.id
}

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "${local.name_tag_prefix}-db-route-table"
  }
}

resource "aws_route_table_association" "db" {
  count          = length(var.aws_subnet.db.*.id)
  subnet_id      = aws_subnet.db.*.id[count.index]
  route_table_id = aws_route_table.db.id
}
