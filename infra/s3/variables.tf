output "bucket_arn" {
  value = aws_s3_bucket.tutoring_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.tutoring_bucket.bucket
}
