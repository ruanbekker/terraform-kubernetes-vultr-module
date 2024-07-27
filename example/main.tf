module "kubernetes" {
  source  = "../"

  cluster_name    = "test-cluster"
  cluster_version = "v1.29.4+1"
}
