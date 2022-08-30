output "region" {
  value = var.region
}

output "project_names" {
  value = var.project_names
}


output "vpc_id" {
  value = var.aws_vpc.vpc.id
}

output "public_subnet_az1" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_app_subnet_az1" {
  value = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2" {
  value = aws_subnet.private_app_subnet_az2.id
}
output "private_data_subnet_az1" {
  value = aws_subnet.private_data_subnet_az1.id
}

output "private_data_subnet_az2" {
  value = aws_subnet.private_data_subnet_az2.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}