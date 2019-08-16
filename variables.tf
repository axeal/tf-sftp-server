variable "do_token" {
}

variable "prefix" {
}

variable "region" {
  default = "fra1"
}

variable "do_size" {
  default = "s-2vcpu-4gb"
}

variable "docker_version" {
  default = "18.09"
}

variable "image" {
  default = "ubuntu-16-04-x64"
}

variable "ssh_keys" {
  default = []
}

variable "sftp_user" {
  default = "sftp"
}

variable "sftp_port" {
  default = 2222
}
