resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = "tf-workspace-demo-bucket-${terraform.workspace}-123456"  
}