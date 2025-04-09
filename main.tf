provider "aws" {
  region = "eu-west-1"
}

locals {
  enabled = true
  

  # attributes = concat(
  #   [
  #     {
  #       name = var.range_key
  #       type = var.range_key_type
  #     },
  #     {
  #       name = var.hash_key
  #       type = var.hash_key_type
  #     }
  #   ],
  #   var.dynamodb_attributes
  # )

  

}

resource "aws_dynamodb_table" "default" {
  attribute {
    name = "id"
    type = "S"
  }
  count                       = local.enabled ? 1 : 0
  name                        = var.table_name
  billing_mode                = var.billing_mode
  read_capacity               = var.billing_mode == "PAY_PER_REQUEST" ? null : var.autoscale_min_read_capacity
  write_capacity              = var.billing_mode == "PAY_PER_REQUEST" ? null : var.autoscale_min_write_capacity
  hash_key                    = var.hash_key
  range_key                   = var.range_key
  stream_enabled              = length(var.replicas) > 0 ? true : var.enable_streams
  stream_view_type            = length(var.replicas) > 0 || var.enable_streams ? var.stream_view_type : ""
  table_class                 = var.table_class
  deletion_protection_enabled = var.deletion_protection_enabled
}