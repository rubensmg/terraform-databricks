variable "project" {
  type        = string
  description = "The name of project (eg. myproject)"
}

variable "url" {
  type        = string
  description = "The URL of the Git Repository to clone from. If value changes, repo is re-created"
}

variable "git_provider" {
  type        = string
  description = "The name of git provider"
}

variable "branch" {
  type        = string
  description = "The name of the branch for initial checkout"
}
