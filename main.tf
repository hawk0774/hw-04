module "vpc_dev" {
  source         = "./modules/vpc"
  env_name       = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr[0]
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = jsonencode(var.ssh_public_key)  
    packages       = jsonencode(var.packages)        
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = var.instance_one_name
  instance_count = 1
  image_family   = var.image_family
  public_ip      = true
  labels = {
    project = "marketing"
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = var.instance_two_name
  instance_count = 1
  image_family   = var.image_family
  public_ip      = true
  labels = {
    project = "analytics"
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
