resource "kubernetes_service" "service" {

  metadata {
    name      = "${var.app}-service"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  spec {
    selector = {
      app = kubernetes_deployment.deployment.metadata.0.labels.app
    }
    session_affinity = var.sessionAffinity
    port {
      port        = var.portExt
      target_port = var.portInt
    }

    type = var.serviceType
  }
}