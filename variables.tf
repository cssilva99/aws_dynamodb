variable "region" {
  type        = string
  default     = "eu-west-2"
  description = ""
}

variable "billing_mode" {
  type        = string
  default     = "PROVISIONED"
  description = "DynamoDB Billing mode. Can be PROVISIONED or PAY_PER_REQUEST"
}

variable "stream_view_type" {
  type        = string
  default     = ""
  description = "When an item in the table is modified, what information is written to the stream"
}

variable "replicas" {
  type        = list(string)
  default     = []
  description = "List of regions to create replica"
}

variable "enable_streams" {
  type        = bool
  default     = false
  description = "Enable DynamoDB streams"
}

variable "table_name" {
  type        = string
  default     = null
  description = "Table name. If provided, the bucket will be created with this name instead of generating the name from the context"
}

variable "table_class" {
  type        = string
  default     = "STANDARD"
  description = "DynamoDB storage class of the table. Can be STANDARD or STANDARD_INFREQUENT_ACCESS"
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "Enable/disable DynamoDB table deletion protection"
}

variable "autoscale_min_read_capacity" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min read capacity"
}

variable "autoscale_min_write_capacity" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min write capacity"
}

variable "dynamodb_attributes" {
  type = list(object({
    name = string
    type = string
  }))
  default     = []
  description = "Additional DynamoDB attributes in the form of a list of mapped values"
}

variable "range_key" {
  type        = string
  default     = ""
  description = "DynamoDB table Range Key"
}

variable "range_key_type" {
  type        = string
  default     = "S"
  description = "Range Key type, which must be a scalar type: `S`, `N`, or `B` for (S)tring, (N)umber or (B)inary data"
}

variable "hash_key" {
  type        = string
  default = "test"
  description = "DynamoDB table Hash Key"
}

variable "hash_key_type" {
  type        = string
  default     = "S"
  description = "Hash Key type, which must be a scalar type: `S`, `N`, or `B` for (S)tring, (N)umber or (B)inary data"
}