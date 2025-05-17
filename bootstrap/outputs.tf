output "bucket_name" {
  value       = aws_s3_bucket.tf_state_bucket.bucket
  description = "Name of the S3 bucket used for Terraform backend"
}
