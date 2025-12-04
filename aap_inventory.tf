resource "aap_inventory" "TechXchangeNL" {
  name = "TechXchangeNL (mark)"
  organization = 2
}

resource "aap_host" "my_host" {
  for_each     = { for idx, instance in aws_instance.web_server : idx => instance }
  inventory_id = aap_inventory.TechXchangeNL.id
  groups = toset([resource.aap_group.my_group.id])
  name         = each.value.tags.Name
  description  = "Host provisioned by HCP Terraform"
  variables    = jsonencode({
    ansible_user = "ec2-user"
    ansible_host = each.value.public_ip
    #public_ip    = each.value.public_ip
    #target_hosts = each.value.public_ip
  })
}

resource "aap_group" "my_group" {
  inventory_id = aap_inventory.TechXchangeNL.id
  name         = "role_webserver"
}

