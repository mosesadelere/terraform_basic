# output "s3_bucket" {
#   description = "create s3 bucket"
#   value = aws_s3_bucket.my_s3_bucket.bucket
# }

output "aws_s3_bucket1" {
  description = "Name of the S3 bucket created by the module"
  value       = module.s3_module1.bucket_id
}

output "aws_s3_bucket2" {
  description = "Name of the S3 bucket created by the second module"
  value       = module.s3_module2.bucket_id
}

output "sg" {
  description = "ID of the default security group"
  value       = data.aws_security_group.sg.id
}

output "ec2" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}