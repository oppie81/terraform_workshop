
data "aap_job_template" "deploy_webserver" {
  name         = "deploy_webserver (mark)"
  organization_name = "TechXchangeNL"
}

data "aap_job_template" "deploy_website" {
  name         = "deploy_website (mark)"
  organization_name = "TechXchangeNL"
}

resource "aap_job" "deploy_webserver" {
  job_template_id = data.aap_job_template.job_template.id
  inventory_id = data.aap_inventory.inventory.id
  organization_name = "TechXchangeNL"
  depends_on = [
    aap_host.my_host,
    aap_group.my_group
  ]
}

resource "aap_job" "deploy_website" {
  job_template_id = data.aap_job_template.job_template.id
  inventory_id = data.aap_inventory.inventory.id
  organization_name = "TechXchangeNL"
  depends_on = [
    aap_host.my_host,
    aap_group.my_group
  ]
}
