
resource "databricks_job" "main" {
  name                = "job-${var.name}-${var.project}"
  existing_cluster_id = var.cluster
  notebook_task {
    notebook_path = var.notebook
  }
}
