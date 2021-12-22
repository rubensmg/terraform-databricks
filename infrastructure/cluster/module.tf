data "databricks_spark_version" "main" {
  long_term_support = true
  ml                = var.version_use_ml
  genomics          = var.version_use_genomics
  gpu               = var.version_use_gpu
  photon            = var.version_use_photon
  scala             = var.version_scala
  spark_version     = var.version_spark
}

data "databricks_node_type" "main" {
  local_disk  = var.node_local_disk
  min_cores   = var.node_min_cores
  gb_per_core = var.node_gb_per_core
  min_gpus    = var.node_min_gpus
}


resource "databricks_cluster" "main" {
  cluster_name            = "cls-${var.project}"
  spark_version           = data.databricks_spark_version.main.id
  node_type_id            = data.databricks_node_type.main.id
  autotermination_minutes = var.autotermination_minutes
  autoscale {
    min_workers = var.min_workers
    max_workers = var.max_workers
  }
}

output "id" {
  value = databricks_cluster.main.id
}
