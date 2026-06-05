# resource "aws_s3_bucket" "my_s3_bucket" {
#   bucket = var.bucket_name
#   acl    = "private"
# }

module "s3_module1" {
  source      = "./s3_module"
  bucket_name = "playground-bucket-terraform-1"
}

module "s3_module2" {
  source      = "./s3_module"
  bucket_name = "playground-bucket-terraform-2"
}

data "aws_security_group" "sg" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}
resource "aws_instance" "ec2" {
  ami           = "ami-0d13e2317a7e75c95"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2Terraform"
  }

  security_groups = [data.aws_security_group.sg.id]
  subnet_id = "subnet-0d24a175c380015ac"
}