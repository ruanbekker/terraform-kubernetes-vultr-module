# terraform-kubernetes-vultr-module
Terraform Module to deploy a VKE Cluster on Vultr.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vultr"></a> [vultr](#requirement\_vultr) | 2.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vultr"></a> [vultr](#provider\_vultr) | 2.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vultr_kubernetes.this](https://registry.terraform.io/providers/vultr/vultr/2.21.0/docs/resources/kubernetes) | resource |
| [vultr_plan.selected](https://registry.terraform.io/providers/vultr/vultr/2.21.0/docs/data-sources/plan) | data source |
| [vultr_region.city](https://registry.terraform.io/providers/vultr/vultr/2.21.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The kubernetes cluster name. | `string` | `"test"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The kubernetes version. | `string` | `"v1.29.4+1"` | no |
| <a name="input_monthly_cost"></a> [monthly\_cost](#input\_monthly\_cost) | The monthly costage. | `string` | `"10"` | no |
| <a name="input_ram"></a> [ram](#input\_ram) | The amount of ram in megabytes. | `string` | `"2048"` | no |
| <a name="input_region_city"></a> [region\_city](#input\_region\_city) | The city name of the region | `string` | `"Amsterdam"` | no |
| <a name="input_vcpu_count"></a> [vcpu\_count](#input\_vcpu\_count) | The amount of vcpu cores. | `string` | `"1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The kubernetes api endpoint. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The kubeconfig in yaml format. |

## Example

You can see a full example in [./example/](./example), and authentication needs to be provided using a api key, which can be seen at [./example/providers.tf](./example/providers.tf).

```hcl
module "kubernetes" {
  source  = "git::https://github.com/ruanbekker/terraform-kubernetes-vultr-module.git?ref=stable"

  cluster_name    = "test-cluster"
  cluster_version = "v1.29.4+1"
}

output "kubeconfig" {
  value     = module.kubernetes.kube_config
  sensitive = true
}
```

Deploy:

```bash
export TF_VAR_vultr_api_key="<vultr-api-key>"
terraform init
terraform apply -auto-approve
```

Set kubeconfig:

```bash
export KUBECONFIG=/tmp/vultr.kubeconfig
terraform output -raw kubeconfig | base64 -d > $KUBECONFIG
```

Access the cluster:

```bash
kubectl get nodes
```

## Module Documentation

The documentation was generated with:

```bash
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 markdown /terraform-docs
```
