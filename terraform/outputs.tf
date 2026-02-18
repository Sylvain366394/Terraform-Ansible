output "web_ip" {
  value = vsphere_virtual_machine.web.default_ip_address
}

output "db_ip" {
  value = vsphere_virtual_machine.db.default_ip_address
}