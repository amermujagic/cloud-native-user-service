variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
}

variable "env" {
  description = "Deployment environment (dev or prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "env must be one of: dev, prod"
  }
}

locals {
  values_file = var.env == "prod" ? "../user-service-chart/values-prod.yaml" : "../user-service-chart/values-dev.yaml"
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.27"
    }
  }
}

provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}

provider "helm" {
  kubernetes {
    config_path = pathexpand("~/.kube/config")
  }
}

resource "helm_release" "user_service" {
  name       = "user-service"
  chart      = "../user-service-chart"

  values = [
    file(local.values_file)
  ]

  set {
    name  = "image.tag"
    value = var.image_tag
  }
}