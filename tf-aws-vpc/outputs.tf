output "region_name" {
  value = var.region_name
}

output "bucket_name" {
  value = var.bucket_name
}

output "dynamodb" {
  value = var.dynamodb
}

output "vpcID" {
  value = aws_vpc.main.id
}

output "subnetID" {
  value = aws_subnet.public_subnet.id
}