
terraform {
  backend "s3" {
    bucket = "ajmc-terraform-state-bucket-123456"
    region = "us-east-1"
    encrypt = false
    key = "ec2/deploy.tfstate"
  }
}
