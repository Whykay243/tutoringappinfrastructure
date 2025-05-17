provider "aws" {
    region  = var.aws_region
    profile = "Adeola"
}

resource "random_id" "bucket_suffix" {
    byte_length = 4
}

module "ec2" {
    source          = "./modules/ec2"
    ami_id          = var.ec2_ami_id
    instance_type   = var.ec2_instance_type
    key_name        = var.ec2_key_name
    subnet_id       = var.ec2_subnet_id
    security_groups = var.ec2_security_groups
    instance_name   = "tutoring-app-ec2"
    user_data       = file("${path.module}/modules/ec2/setup.sh")  # Your startup script
}

module "rds" {
    source           = "./modules/rds"
    db_identifier    = "tutoring-db"
    allocated_storage= 20
    engine           = "mysql"
    instance_class   = "db.t3.micro"
    db_name          = "tutoringdb"
    username         = var.rds_username
    password         = var.rds_password
}

module "s3" {
    source      = "./modules/s3"
    bucket_name = "tutoring-app-bucket-${random_id.bucket_suffix.hex}"
}
