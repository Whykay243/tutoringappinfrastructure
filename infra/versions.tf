terraform {
  backend "s3" {
    bucket = "tutoring-tfstate-bucket-<your-random-suffix>"  # Replace dynamically via CI pipeline
    key    = "infra/terraform.tfstate"
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

