terraform {
  required_version = "0.11.13"
}

variable "do_token" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "nyc1"
}

variable "base_name" {
  type    = "string"
  default = "elk-staging"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

#===============================================================================

module "elk-staging-droplet" {
  source = "git@github.com:vermilion-tech/terraform-digitalocean.git?ref=development//modules/droplet"

  name     = "${var.base_name}"
  region   = "${var.region}"
  ssh_keys = ["ac:ff:22:c4:52:b3:10:e6:01:ca:80:c0:6d:8b:96:bc"]
  size     = "s-2vcpu-4gb"
  tags     = ["elk-staging"]
}

module "elk-staging-floating_ip" {
  source = "git@github.com:vermilion-tech/terraform-digitalocean.git?ref=development//modules/floating_ip"

  droplet_id = "${module.elk-staging-droplet.droplet_id}"
  region     = "${var.region}"
}

module "elk-staging-dns" {
  source = "git@github.com:vermilion-tech/terraform-digitalocean.git?ref=development//modules/dns"

  domain = "vermilion.tech"
  name   = "${var.base_name}"
  value  = "${module.elk-staging-floating_ip.ipv4_address}"
}
