variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "tf_state_bucket" {
  description = "S3 bucket for Terraform backend"
  type        = string
}

variable "tf_state_dynamodb_table" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
}
