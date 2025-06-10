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