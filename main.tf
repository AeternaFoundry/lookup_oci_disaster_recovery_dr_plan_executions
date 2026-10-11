data "oci_disaster_recovery_dr_plan_executions" "disaster_recovery_dr_plan_executions_lookup" {
  for_each = var.disaster_recovery_dr_plan_executions_lookup

  dr_protection_group_id = each.value.dr_protection_group_id
  display_name           = each.value.display_name
  dr_plan_execution_id   = each.value.dr_plan_execution_id
  state                  = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

