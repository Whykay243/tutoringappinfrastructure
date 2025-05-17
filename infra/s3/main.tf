resource "aws_s3_bucket" "tutoring_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}
