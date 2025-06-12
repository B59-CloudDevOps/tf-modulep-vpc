locals {
  tags            = merge(var.tags, { module_name = "tf-module-vpc" })
  name_tag_prefix = var.env
  web_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-web-subnet-${count.index}" })
  app_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-app-subnet-${count.index}" })
  db_subnet_tags  = merge(local.tags, { Name = "${local.name_tag_prefix}-db-subnet-${count.index}" })
}