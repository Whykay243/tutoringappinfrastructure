terraform {
  backend "s3" {
    bucket = "tutoring-tfstate-bucket-3f4a1c"   # Use the real bucket name created by bootstrap
    key    = "tutoring_app_infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
