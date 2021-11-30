variable "url" {
  type        = string
  description = "The url of repository"
}

variable "git_provider" {
  type        = string
  description = "The name of git provider"
}

variable "branch" {
  type        = string
  description = "The name of branch"
}

variable "workspace_folder" {
  type        = string
  description = "The fodler of workspace (will be created in /Repos/workspace_folder/repo_name)"
}
