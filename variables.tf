variable "environment_name" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 48
}

variable "project" {
  type = string
}

variable "region" {
  type = string
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

variable "network_tags" {
  type    = list(string)
  default = null
}

variable "service_account_email" {
  type    = string
  default = null
}


variable "access_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol"
  ]
}
