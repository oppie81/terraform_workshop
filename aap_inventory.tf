resource "aap_inventory" "TechXchangeNL (mark)" {
  name = "TechXchangeNL (mark)"
  organization_name = "TechXchangeNL"
}

resource "aap_host" "my_host" {
  for_each     = { for idx, instance in aws_instance.web_server : idx => instance }
  inventory_id = aap_inventory.inventory.id
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

resource "aap_group" "my_groub" {
  inventory_id = aap_inventory.my_inventory.id
  name         = "role_webserver"
}

