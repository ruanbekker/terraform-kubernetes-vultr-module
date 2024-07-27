output "endpoint" {
  description = "The kubernetes api endpoint."
  value       = "https://${vultr_kubernetes.this.endpoint}:6443"
}

output "client_certificate" {
  value = vultr_kubernetes.this.client_certificate
}

output "client_key" {
  value = vultr_kubernetes.this.client_key
}

output "cluster_ca_certificate" {
  value = vultr_kubernetes.this.cluster_ca_certificate
}

output "kube_config" {
  description = "The kubeconfig in yaml format."
  value       = vultr_kubernetes.this.kube_config
}


