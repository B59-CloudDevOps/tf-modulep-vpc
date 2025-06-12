locals {
  tags            = merge(var.tags, { module_name = "tf-module-vpc" })
  name_tag_prefix = var.env
  web_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-web-subnet" })
  app_subnet_tags = merge(local.tags, { Name = "${local.name_tag_prefix}-app-subnet" })
  db_subnet_tags  = merge(local.tags, { Name = "${local.name_tag_prefix}-db-subnet" })
  igw_tags        = merge(local.tags, { Name = "${local.name_tag_prefix}-igw" })
  nat_tags        = merge(local.tags, { Name = "${local.name_tag_prefix}-nat-gw" })
}