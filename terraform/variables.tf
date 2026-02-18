variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" { sensitive = true }

variable "datacenter" { default = "LON" }
variable "host"       { default = "192.168.10.100" }

variable "datastore"  { default = "DATA2" }
variable "network"    { default = "LAN-EPSI" }

variable "template_vm_name" { default = "tpl-ubuntu" }

variable "vm_web_name" { default = "vm-web" }
variable "vm_db_name"  { default = "vm-db" }

variable "vm_cpu" { default = 1 }
variable "vm_mem" { default = 1024 } # MB