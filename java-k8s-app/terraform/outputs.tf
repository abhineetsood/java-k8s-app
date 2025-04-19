output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "k8s_service_name" {
  value = module.k8s.k8s_service_name
}