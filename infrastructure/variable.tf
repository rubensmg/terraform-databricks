variable "workspace_folder" {
  default     = null
  description = "The fodler of workspace (will be created in /Repos/workspace_folder/repo_name)"
  type        = string
}

variable "repository" {
  type = object({
    url          = string
    git_provider = string
    branch       = string
  })
  description = "The configuration of repository"
}
