########
#Global#
########

variable "instance_name" {
  type        = string
  description = "Name of the instance"
}

variable "display_name" {
  type        = string
  description = "A short name or phrase used to identify the policy in dashboards, notifications, and incidents"
}

variable "enabled" {
  type        = string
  description = "Enable or Disable policy"
}

variable "combiner" {
  type        = string
  description = "how to combine the results of multiple conditions to determine if an incident should be opened. possible values are: * AND * OR * AND_WITH_MATCHING_RESOURCE"
  default     = "OR"
}

# variable "filter" {
#   type   = string
#   default = {}
#   description = "A filter that identifies which time series should be compared with the threshold."
# }

variable "duration" {
  type        = string
  description = "The amount of time that a time series must fail to report new data to be considered failing."
}

variable "comparison" {
  type        = string
  description = "The comparison to apply between the time series (indicated by filter and aggregation) and the threshold (indicated by threshold_value). ossible values are: * COMPARISON_GT * COMPARISON_GE * "
  default     = "COMPARISON_GT"
}

variable "alignment_period" {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 second"
  default     = "60s"
}

# variable "per_series_aligner" {
#   type   = string
#   default = {}
#   description = "The approach to be used to align individual time series, Possible values are ALIGN_MIN * ALIGN_MAX * ALIGN_MEAN * ALIGN_COUNT * ALIGN_SUM *"
# }

variable "cpu_threshold_value" {
  type   = number
  description = "A value against which to compare the time series."
}

variable "memory_threshold_value" {
  type   = number
  description = "A value against which to compare the time series."
}

variable "disk_threshold_value" {
  type   = number
  description = "A value against which to compare the time series."
}

variable "violation_count" {
  type        = number
  description = "number of times series violeted"
}

variable "notification_channel_display_name" {
  type        = string
  description = "Name of Notification channel"
}

variable "channel_type" {
  type        = string
  description = "Type of Notification channel"
}

variable "email_address" {
  type        = string
  description = "Email addresses to be added in Notification channel"
}