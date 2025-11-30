variable "ami" {
  description = "Ubuntu ami"
  default     = "t2.micro"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "key_name" {
  description = "Key name for the EC2 instance"
  default     = "ajmc-martalbaroot-aws"
  type        = string
}

locals {
  common_tags = {
    Project     = "DevOpsCourse"
    Owner       = "ajmc"
    Environment = "Dev"
  }
}
