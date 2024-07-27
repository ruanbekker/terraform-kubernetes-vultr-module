data "vultr_region" "city" { 
  filter { 
    name = "city" 
    values = [ var.region_city ] 
  } 
}

data "vultr_plan" "selected" {
  filter {
    name   = "monthly_cost"
    values = [ var.monthly_cost ]
  }

  filter {
    name   = "ram"
    values = [ var.ram ]
  }

  filter {
    name   = "vcpu_count"
    values = [ var.vcpu_count ]
  }

}

resource "vultr_kubernetes" "this" {
    region  = data.vultr_region.city.id
    label   = var.cluster_name
    version = var.cluster_version
    node_pools {
      node_quantity = 3
      plan = data.vultr_plan.selected.id # defaults: "vc2-1c-2gb"
      label = var.cluster_name
      auto_scaler = true
      min_nodes = 3
      max_nodes = 5
    }
} 

