terraform {
  backend "s3" {
    bucket         = "python-project-terraform-state"
    key            = "qa/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "python-project-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "../modules/vpc"
  env        = var.environment
  aws_region = var.aws_region
}

module "iam" {
  source     = "../modules/iam"
  env        = var.environment
}

module "eks" {
  source         = "../modules/eks"
  cluster_name   = "${var.project_name}-${var.environment}-eks"
  env            = var.environment
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnet_ids
  node_role_arn  = module.iam.node_role_arn
}

module "alb" {
  source     = "../modules/alb"
  env        = var.environment
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "rds" {
  source                = "../modules/rds"
  env                   = var.environment
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  vpc_id                = module.vpc.vpc_id
  db_subnet_ids         = module.vpc.private_subnet_ids
  db_security_group_ids = [module.vpc.db_sg_id]
}
