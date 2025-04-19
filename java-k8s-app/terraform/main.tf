provider "aws" {
  region = var.aws_region
}

module "eks" {
  source      = "./eks"
  aws_region  = var.aws_region
  cluster_name = var.cluster_name
  vpc_id      = var.vpc_id
  subnets     = var.subnets
}

module "k8s" {
  source                  = "./k8s"
  cluster_endpoint        = module.eks.eks_cluster_endpoint
  cluster_ca_certificate  = module.eks.eks_cluster_security_group_id
  cluster_token          = data.aws_eks_cluster_auth.token.token
}