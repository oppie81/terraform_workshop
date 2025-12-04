
data "aap_job_template" "deploy_webserver (mark)" {
  name         = "deploy_webserver (mark)"
  organization_name = "TechXchangeNL"
}

data "aap_job_template" "deploy_website (mark)" {
  name         = "deploy_website (mark)"
  organization_name = "TechXchangeNL"
}

resource "aap_job" "deploy_webserver (mark)" {
  job_template_id = data.aap_job_template.job_template.id
  inventory_id = data.aap_inventory.inventory.id
  organization_name = "TechXchangeNL"
  depends_on = [
    aap_host.my_host,
    aap_group.my_group
  ]
}

resource "aap_job" "deploy_website (mark)" {
  job_template_id = data.aap_job_template.job_template.id
  inventory_id = data.aap_inventory.inventory.id
  organization_name = "TechXchangeNL"
  depends_on = [
    aap_host.my_host,
    aap_group.my_group
  ]
}
