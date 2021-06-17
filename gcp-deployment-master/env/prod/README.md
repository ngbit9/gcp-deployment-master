## This is a collection of submodules that make it easier to create and manage Google Cloud Platform services:

| Name | Description | SelfLink
|------|-------------|------|
| Global | This module consist of Google Cloud Global resources such as GCS, IAM, Networking| [global](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global) |
| Modules | This module consist of Google Cloud Modules for resources such as Compute engine, Cloudsql, GKR, Dataproc. We can resuse this modules in regions folder for creating multiple resources. | [modules](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/modules) |
| Regions | This module consist of Google Cloud resouces which we can deploy in specific region using the above module resources | [regions](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/regions) |
| Resources | This module consist of keys and scripts we can use while deploying resources. | [resources](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/resources) |

