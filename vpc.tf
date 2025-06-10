resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = merge(local.tags,
    {
      Name = "roboshop-${local.name_tag_prefix}-vpc"
    }
  )
}