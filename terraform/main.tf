resource "kubernetes_namespace" "todo" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "todo" {
  metadata {
    name      = "todo-deployment"
    namespace = kubernetes_namespace.todo.metadata[0].name
    labels = {
      app = "todo-app"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "todo-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "todo-app"
        }
      }

      spec {
        container {
          image = var.docker_image
          name  = "todo-app"

          port {
            container_port = 5000
          }

          env {
            name = "POD_NAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 5000
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/"
              port = 5000
            }
            initial_delay_seconds = 3
            period_seconds        = 5
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo" {
  metadata {
    name      = "todo-service"
    namespace = kubernetes_namespace.todo.metadata[0].name
  }

  spec {
    selector = {
      app = "todo-app"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}

output "service_name" {
  value = kubernetes_service.todo.metadata[0].name
}

output "namespace" {
  value = kubernetes_namespace.todo.metadata[0].name
}