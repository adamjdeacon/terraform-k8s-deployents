output "publicIP" {
  value = kubernetes_service.service.status.0.load_balancer.0.ingress.0.ip
}