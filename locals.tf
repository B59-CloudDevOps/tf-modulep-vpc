locals {
  tags            = merge(var.tags, { module_name = "tf-module-vpc" })
  name_tag_prefix = var.env
  web_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-web-subnet-${local.zonename}" })
  app_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-app-subnet-${local.zonename}" })
  db_subnet_tags  = merge(local.tags, { Name = "${local.name_tag_prefix}-db-subnet-${local.zonename}" })
  zonename        = var.az[count.index]
}