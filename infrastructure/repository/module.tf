resource "databricks_repo" "main" {
  url          = var.url
  git_provider = var.git_provider
  branch       = var.branch
  path         = var.workspace_folder == null ? null : "/Repos/${var.workspace_folder}/${element(split("/", replace(var.url, ".git", "")), length(split("/", var.url)) - 1)}"
}
