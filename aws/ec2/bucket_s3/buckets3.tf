resource "aws_s3_bucket" "my_s3" {
  bucket = "ajmc-terraform-state-bucket-123456"

  tags = {
    Name        = "MyTerraformStateBucket"
    Environment = "Dev"
    Owner       = "ajmc"
  }
}