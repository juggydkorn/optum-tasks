provider "kubernetes" {
  config_path = "~/.kube/config"
}
# Create a Kubernetes namespace
resource "kubernetes_namespace" "grafana" {
  metadata {
    name = "grafana"
  }
}

resource "kubernetes_config_map" "grafana-dashboards" {
  metadata {
    name      = "grafana-dashboards"
    namespace = "${kubernetes_namespace.grafana.metadata.0.name}"
  }
}
# Create a Kubernetes deployment
resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }
 
  spec {
    selector {
      match_labels = {
        app = "grafana"
      }
    }
 
    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }
 
      spec {
        container {
          image = "grafana/grafana:latest"
          name = "grafana"
 
          port {
            container_port = 3000
          }
        }
      }
    }
 
    replicas = 1
  }
}

# Create a Kubernetes service
resource "kubernetes_service" "grafana" {
  metadata {
    name = "grafana"
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }
 
  spec {
    selector = {
      app = "grafana"
    }
 
    port {
      name = "http"
      port = 80
      target_port = 3000
    }
 
    type = "LoadBalancer"
  }
}

# Nginx

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    namespace = kubernetes_namespace.grafana.metadata[0].name
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginxExample"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "example"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

# Nginx service to expose port

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

#Autoscaler on Memory usage metric
resource "kubernetes_horizontal_pod_autoscaler" "example" {
  metadata {
    name = "test"
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }

  spec {
    min_replicas = 2
    max_replicas = 2

    scale_target_ref {
      kind = "Deployment"
      name = "scalable-nginx-example"
    }

    metric {
      type = "External"
      external {
        metric {
          name = "memory"
          selector {
            match_labels = {
              lb_name = "test"
            }
          }
        }
        target {
          type  = "Value"
          value = "90"
        }
      }
    }
  }
}