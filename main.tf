# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "random_password" "sftp_password" {
  length = 30
}

data "template_file" "userdata" {
  template = file("files/userdata")

  vars = {
    docker_version = var.docker_version
    sftp_user = var.sftp_user
    sftp_password = random_password.sftp_password.result
    sftp_port = var.sftp_port
  }
}

resource "digitalocean_droplet" "sftp_server" {
  image     = var.image
  name      = "${var.prefix}-sftp"
  region    = var.region
  size      = var.do_size
  user_data = data.template_file.userdata.rendered
  ssh_keys  = var.ssh_keys
}

output "command" {
  value = "sftp -P ${var.sftp_port} ${var.sftp_user}@${digitalocean_droplet.sftp_server.ipv4_address}"
}

output "password" {
  value = random_password.sftp_password.result
}
