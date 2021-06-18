provider "google" {
  version = "~> 3.51"
  region  = "asia-south1"
}

module "pubsub" {
  source       = "../../modules/pub-sub"
  project_id   = var.project_id
  topic        = var.topic_name
  topic_labels = var.topic_labels

  pull_subscriptions = [
    {
      name                 = "pull"
      ack_deadline_seconds = 10
    },
  ]

  push_subscriptions = [
    {
      name                 = "push"
      push_endpoint        = "https://${var.project_id}.appspot.com/"
      x-goog-version       = "v1beta1"
      ack_deadline_seconds = 20
      expiration_policy    = "1209600s" // two weeks
    },
  ]

}
