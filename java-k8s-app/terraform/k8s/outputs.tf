output "k8s_service_name" {
  value = kubernetes_service.java_k8s_app.metadata[0].name
}

output "k8s_service_port" {
  value = kubernetes_service.java_k8s_app.spec[0].port[0].port
}