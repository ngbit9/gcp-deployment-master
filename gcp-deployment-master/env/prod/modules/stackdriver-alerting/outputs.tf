output "policy_name" {
  value = "${google_monitoring_alert_policy.utilization_alert_policy.display_name}"
}

output "notification_id" {
  value = "${google_monitoring_notification_channel.basic.id}"
}
