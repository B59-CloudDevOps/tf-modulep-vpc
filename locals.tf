locals {
  tags = merge(var.tags,
    {
      module_name = "tf-module-vpc"
    }
  )
  name_tag_prefix = var.env
}