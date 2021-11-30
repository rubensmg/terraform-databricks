module "repository" {
  source           = "./repository"
  url              = var.repository.url
  git_provider     = var.repository.git_provider
  branch           = var.repository.branch
  workspace_folder = var.workspace_folder
}
