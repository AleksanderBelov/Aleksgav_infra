provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source           = "../modules/app"
  public_key_path  = "${var.public_key_path}"
  zone             = "${var.zone}"
  app_disk_image   = "${var.app_disk_image}"
  private_key_path = "${var.private_key_path}"
  reddit_db_addr   = "${module.db.db_internal_ip}"
  is_deploy_app       = "${var.is_deploy_app}"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = "${var.public_key_path}"
  zone             = "${var.zone}"
  db_disk_image    = "${var.db_disk_image}"
  private_key_path = "${var.private_key_path}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["46.188.23.134/32"]
}
