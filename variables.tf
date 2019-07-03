variable "environment_name" {
  type = string
}

variable "owner_name" {
  type    = string
  default = null
}

variable "ttl" {
  type    = number
  default = 48
}

variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west4"
}

variable "zone" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "size" {
  type    = string
  default = "n1-standard-2"
}

variable "network" {
  type    = string
  default = null
}

variable "subnet" {
  type    = string
  default = null
}

variable "image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "user_data" {
  description = "Cloud init user data script in plain text"
  type        = string
  default     = null
}


variable "tags" {
  type    = map
  default = null
}
