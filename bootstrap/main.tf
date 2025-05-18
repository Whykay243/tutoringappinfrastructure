terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Change if you use a different region
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

resource "aws_s3_bucket_ownership_controls" "tf_state_bucket_ownership" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}


resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
