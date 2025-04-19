provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  token                  = var.cluster_token
}

resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "app-config"
    namespace = "default"
  }

  data = {
    "application.properties" = <<EOT
server.port=8080
spring.datasource.url=jdbc:mysql://localhost:6/mydb
spring.datasource.username=user
spring.datasource.password=pass
logging.level.root=INFO
logging.level.com.example=DEBUG
EOT
  }
}

resource "kubernetes_deployment" "java_k8s_app" {
  metadata {
    name      = "java-k8s-app"
    namespace = "default"
    labels = {
      app = "java-k8s-app"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "java-k8s-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "java-k8s-app"
        }
      }

      spec {
        container {
          image = "your-docker-repo/java-k8s-app:latest"
          name  = "java-k8s-app"

          ports {
            container_port = 8080
          }

          env {
            name  = "SPRING_PROFILES_ACTIVE"
            value = "prod"
          }

          resources {
            requests = {
              memory = "512Mi"
              cpu    = "500m"
            }
            limits = {
              memory = "1Gi"
              cpu    = "1"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "java_k8s_app" {
  metadata {
    name      = "java-k8s-app"
    namespace = "default"
    labels = {
      app = "java-k8s-app"
    }
  }

  spec {
    selector = {
      app = "java-k8s-app"
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "ClusterIP"
  }
}