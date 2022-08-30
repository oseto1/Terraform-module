# configure aws provider
provider "aws" {
  region = var.region
  profile = "terraform-user"
}

# create vpc
module "vpc" {
    source = "../modules/vpc"
  region                       = var.region
  project_names                = var.project_names
  cidr_block                   = var.cidr_block
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}