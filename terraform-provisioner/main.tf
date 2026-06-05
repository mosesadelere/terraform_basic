terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = "my-${terraform.workspace}-12345"
  acl    = "private"
  
}

resource "null_resource" "local_file" {
  provisioner "local-exec" {
    command = "echo 's3 bucket created: ${aws_s3_bucket.aws_s3_bucket.bucket}' > hello.txt"
  }
  
}