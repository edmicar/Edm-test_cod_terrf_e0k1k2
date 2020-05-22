#
# Variables Configuration
# []

variable "cluster-name" {
  type        = string
  description = "The name of your EKS Cluster"
  default = "dev-eks-terraform"
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

variable "sg_cluster"{
   type = string
   default = "sg-099d0329d5a8ab4c2"
}

variable "Iam_attch_AmazonEKSClusterPolicy" {
  type = list(object({
    id = string
    policy_arn = string
    role = string
  }))

  default = []
}
variable "Iam_attch_AmazonEKSServicePolicy" {
  type = list(object({
    policy_arn = string
    role = string
  }))

  default = [
    {
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
	role = "Role_Eksterraform"
    },
  ]
}

variable "Iam_attch_AmazonEC2ContainerRegistryReadOnly" {
  type = list(object({
    id = string
    policy_arn = string
    role = string
  }))

  default = [
    {
  "id" = "Role_Eksterraform-20200515104503561600000001"
  "policy_arn" = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  "role" = "Role_Eksterraform"
    },
  ]
}

variable "Iam_attch_AmazonEKSWorkerNodePolicy" {
  type = list(object({
    id = string
    policy_arn = string
    role = string
  }))

  default = [
    {
		id = "Role_Eksterraform-20200515104503561600000001"
		policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
		role = "Role_Eksterraform"
    },
  ]
}


variable "Iam_attch_AmazonEKS_CNI_Policy" {
  type = list(object({
    id = string
    policy_arn = string
    role = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515104503574800000003"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
	role = "Role_Eksterraform"
    },
  ]
}


variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type        = list(string)
  default     = []
}

variable "kubeconfig_aws_authenticator_env_variables" {
  description = "Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = \"eks\"}."
  type        = map(string)
  default     = {}
}

#####################################################################

variable "config_output_path" {
  description = "Where to save the Kubectl config file (if `write_kubeconfig = true`). Assumed to be a directory if the value ends with a forward slash `/`."
  type        = string
  default     = "./"
}

variable "write_kubeconfig" {
  description = "Whether to write a Kubectl config file containing the cluster configuration. Saved to `config_output_path`."
  type        = bool
  default     = true
}

variable "write_aws_auth_config" {
  description = "Whether to write the aws-auth configmap file."
  type        = bool
  default     = true
}

variable "manage_aws_auth" {
  description = "Whether to apply the aws-auth configmap file."
  default     = true
}

variable "local_exec_interpreter" {
  description = "Command to run for local-exec resources. Must be a shell-style interpreter. If you are on Windows Git Bash is a good choice."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}


variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}


variable "kubeconfig_aws_authenticator_command" {
  description = "Command to use to fetch AWS EKS credentials."
  type        = string
  default     = "aws-iam-authenticator"
}

variable "kubeconfig_aws_authenticator_command_args" {
  description = "Default arguments passed to the authenticator command. Defaults to [token -i $cluster_name]."
  type        = list(string)
  default     = []
}


variable "kubeconfig_aws_authenticator_additional_args" {
  description = "Any additional arguments to pass to the authenticator such as the role to assume. e.g. [\"-r\", \"MyEksRole\"]."
  type        = list(string)
  default     = []
}



#############################################################################
#################################################
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
}

variable "kubeconfig_name" {
  description = "Override the default name used for items kubeconfig."
  type        = string
  default     = ""
 }                   



variable "subnets" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

