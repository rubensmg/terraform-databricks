resource "databricks_repo" "main" {
  url          = var.url
  git_provider = var.git_provider
  branch       = var.branch
  path         = "/Repos/${var.project}/${element(split("/", replace(var.url, ".git", "")), length(split("/", var.url)) - 1)}"
}

output "path" {
  value = databricks_repo.main.path
}
