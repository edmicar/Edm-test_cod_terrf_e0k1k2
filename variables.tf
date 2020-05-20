#
# Variables Configuration
#

variable "cluster-name" {
  default = "Clustereks-codePip01"
  type    = string
}
variable "vpc_id" {
  type        = string
  default = "vpc-091d034b917c22585"
}

variable "vpc_subnets" {
type = "list"
default = ["subnet-03f54a1fbe3c2569a","subnet-0efb46819fa692cea"]
}

variable "roletfeks_id" {
  type        = string
  default = "Role_Eksterraform"
}

variable "iam_role_arn_terraform" {
  type = string
  default = "arn:aws:iam::599853486601:role/Role_Eksterraform"
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::599853486601:role/Role_Eksterraform"
      username = "Role_Eksterraform"
      groups   = ["system:masters"]
    },
  ]
}

