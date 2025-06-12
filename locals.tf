locals {
  tags            = merge(var.tags, { module_name = "tf-module-vpc" })
  name_tag_prefix = var.env
  web_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-web-subnet-${var.az[count.index]}" })
  app_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-app-subnet-${var.az[count.index]}" })
  db_subnet_tags  = merge(local.tags, { Name = "${local.name_tag_prefix}-db-subnet-${var.az[count.index]}" })
}