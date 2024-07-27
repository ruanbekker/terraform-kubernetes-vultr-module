variable "cluster_name" {
  type        = string
  default     = "test"
  description = "The kubernetes cluster name."
}

variable "cluster_version" {
  type        = string
  default     = "v1.29.4+1"
  description = "The kubernetes version." 
}

variable "vcpu_count" {
  type        = string
  default     = "1"
  description = "The amount of vcpu cores."
}

variable "ram" {
  type        = string
  default     = "2048"
  description = "The amount of ram in megabytes."
}

variable "monthly_cost" {
  type        = string
  default     = "10"
  description = "The monthly costage."
}

variable "region_city" {
  type        = string
  default     = "Amsterdam"
  description = "The city name of the region"

  validation {
    condition = anytrue([
      var.region_city == "Amsterdam",
      var.region_city == "Frankfurt",
      var.region_city == "London",
      var.region_city == "Seattle",
      var.region_city == "Sydney",
      var.region_city == "Tokyo"
    ])
    error_message = "City name must match 'Amsterdam', 'Frankfurt', 'London', 'Seattle', 'Sydney', or 'Tokyo'."
  }
}

