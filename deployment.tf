resource "kubernetes_deployment" "deployment" {
  metadata {
    name = var.app
    labels = {
      app = var.app
    }
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app
      }
    }

    template {
      metadata {
        labels = {
          app = var.app
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = var.app
          env {
            name  = "IAMALIVE"
            value = "1"
          }
          env {
            name  = "Environment"
            value = "prod"
          }

          resources {
            limits = {
              cpu    = var.limits.0.cpu
              memory = var.limits.0.memory
            }
            requests = {
              cpu    = var.requests.0.cpu
              memory = var.requests.0.memory
            }
          }

          #           liveness_probe {
          #             http_get {
          #               path = "/nginx_status"
          #               port = 80
          # 
          #               http_header {
          #                 name  = "X-Custom-Header"
          #                 value = "Awesome"
          #               }
          #             }
          # 
          #             initial_delay_seconds = 3
          #             period_seconds        = 3
          #           }
        }
      }
    }
  }
}