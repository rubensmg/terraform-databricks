variable "project" {
  type        = string
  description = "The name of project (eg. myproject)"
}

variable "cluster" {
  type = object({
    configuration = object({
      use_ml        = bool
      use_genomics  = bool
      use_gpu       = bool
      use_photon    = bool
      version_scala = string
      version_spark = string
    })
    node = object({
      local_disk  = bool
      gb_per_core = number
      min_cores   = number
      min_gpus    = number
    })
    autotermination_minutes = number
    scaling = object({
      min = number
      max = number
    })
  })
  description = "The configuration of cluster"
}

variable "repository" {
  type = object({
    url          = string
    git_provider = string
    branch       = string
  })
  description = "The configuration of repository"
}

variable "jobs" {
  type = list(object({
    name     = string
    notebook = string
  }))
  description = "The configuration of job"
  default     = []
}
