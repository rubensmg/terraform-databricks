variable "project" {
  type        = string
  description = "The name of project (eg. myproject)"
}

variable "name" {
  type        = string
  description = "The name of job"
}

variable "cluster" {
  type        = string
  description = "The id of cluster"
}

variable "notebook" {
  type        = string
  description = "The notebook path"
}
