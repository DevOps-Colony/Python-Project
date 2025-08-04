module "vpc" {
  source     = "../modules/vpc"
  env        = "staging"
  aws_region = var.aws_region
}

module "iam" {
  source = "../modules/iam"
}

module "eks" {
  source       = "../modules/eks"
  cluster_name = "flask-app-cluster-staging"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
  node_iam_role_arn = module.iam.node_role_arn
}

module "rds" {
  source         = "../modules/rds"
  vpc_id         = module.vpc.vpc_id
  db_subnet_ids  = module.vpc.private_subnet_ids
}

module "alb" {
  source       = "../modules/alb"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids
  alb_name     = "flask-alb"
}
