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

# create nat gateway
module "nat_gateway" {
  source =  "../modules/nat-gateway"
public_subnet_az1_id        = module.vpc.public_subnet_az1_id
internet_gateway            = module.vpc.internet_gateway
public_subnet_az2_id           = module.vpc.public_subnet_az2_id
vpc_id                      = module.vpc.vpc_id
private_app_subnet_az1_id   = module.vpc.private_app_subnet_az1_id
private_data_subnet_az1_id  = module.vpc.private_data_subnet_az1_id
private_app_subnet_az2_id   = module.vpc.private_app_subnet_az2_id
private_data_subnet_az2_id  = module.vpc.private_data_subnet_az2_id
  }

module "security_group" {
  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id

}

module "ecs_task_execution_role" {
 source       = "../modules/ecs-task-execution-role"
 project_name = module.vpc.project_names
}