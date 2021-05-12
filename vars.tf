variable "cluster" {
  #default = "gke_infrastructure-253908_europe-west2-b_infrastructure"
  default = "minikube"
}

variable "app" {
  default = "frontend"
}

variable "namespace" {
  default = "frontend"
}

variable "replicas" {
  default = 2
}
variable "serviceType" {
  #ClusterIP, NodePort, and LoadBalancer. ExternalName
  default = "LoadBalancer"
}
variable "sessionAffinity" {
  # ClientIP or None
  default = "None"
}

variable "portExt" {
  default = 1234
}

variable "portInt" {
  default = 80
}

variable "limits" {
  type = list(object({
    cpu    = string
    memory = string
  }))
  default = [
    {
      cpu    = "555m"
      memory = "512Mi"
    }
  ]
}

variable "requests" {
  type = list(object({
    cpu    = string
    memory = string
  }))
  default = [
    {
      cpu    = "250m"
      memory = "50Mi"
    }
  ]
}