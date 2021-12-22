module "repository" {
  source       = "./repository"
  project      = var.project
  url          = var.repository.url
  git_provider = var.repository.git_provider
  branch       = var.repository.branch
}

module "cluster" {
  source                  = "./cluster"
  project                 = var.project
  version_use_ml          = var.cluster.configuration.use_ml
  version_use_genomics    = var.cluster.configuration.use_genomics
  version_use_gpu         = var.cluster.configuration.use_gpu
  version_use_photon      = var.cluster.configuration.use_photon
  version_scala           = var.cluster.configuration.version_scala
  version_spark           = var.cluster.configuration.version_spark
  node_local_disk         = var.cluster.node.local_disk
  node_gb_per_core        = var.cluster.node.gb_per_core
  node_min_cores          = var.cluster.node.min_cores
  node_min_gpus           = var.cluster.node.min_gpus
  node_type               = var.cluster.node.flavor
  autotermination_minutes = var.cluster.autotermination_minutes
  min_workers             = var.cluster.scaling.min
  max_workers             = var.cluster.scaling.max
}

module "job" {
  source   = "./job"
  for_each = { for job in var.jobs : job.name => job }
  project  = var.project
  name     = each.key
  cluster  = module.cluster.id
  notebook = "${module.repository.path}/${each.value.notebook}"
  depends_on = [
    module.cluster,
    module.repository
  ]
}
