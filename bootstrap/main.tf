terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}


resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "tutoring-tfstate-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Bootstrap"
  }
}

resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.tf_state_bucket.bucket
  description = "Name of the S3 bucket used for Terraform backend"
}
