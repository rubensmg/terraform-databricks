variable "project" {
  type        = string
  description = "The name of project (eg. myproject)"
}

variable "version_use_ml" {
  type        = bool
  description = "If we should limit the search only to ML runtimes"
}

variable "version_use_genomics" {
  type        = bool
  description = "If we should limit the search only to Genomics"
}

variable "version_use_gpu" {
  type        = bool
  description = "If we should limit the search only toruntimes that supports GPUs"
}

variable "version_use_photon" {
  type        = bool
  description = "If we should limit the search only to Photon runtimes"
}

variable "version_scala" {
  type        = string
  description = "If we shouldlimit the search only to runtimes that are based on specific Scala version"
}


variable "version_spark" {
  type        = string
  description = "If we should limit the search only to runtimes that are based on specific Spark Version"
}


variable "node_gb_per_core" {
  type        = number
  description = "The number of gigabytes per core available on instane"
}

variable "node_min_cores" {
  type        = number
  description = "Minimum number of CPU cores available on instance"
}

variable "node_min_gpus" {
  type        = number
  description = "Minimum number of GPUs attached to instance"
}

variable "node_local_disk" {
  type        = bool
  description = "Pick only nodes with local storage"
}

variable "node_type" {
  type        = string
  description = "The type of node"
}

variable "autotermination_minutes" {
  type        = number
  description = "Automatically terminate the cluster after being inactive for this time in minutess"
}

variable "min_workers" {
  type        = number
  description = "The minimum number of workers to which the cluster can scale down when underutilized"
}

variable "max_workers" {
  type        = number
  description = "The maximum number of workers to which the cluster can scale up when overloaded"
}
