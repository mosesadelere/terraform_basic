terraform {
  backend "s3" {
    bucket         = "easz-terraform-lock"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-remote-table"
  }
}