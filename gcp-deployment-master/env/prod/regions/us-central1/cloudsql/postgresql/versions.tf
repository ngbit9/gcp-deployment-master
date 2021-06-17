terraform {
  required_version = "~> 0.12.24"

  required_providers {
    google      = ">= 3.16, <4.0.0"
    google-beta = "~> 3.24"
    null        = "~> 2.1"
    random      = "~> 2.2"
  }
}
