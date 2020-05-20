#
# Variables Configuration
#

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
variable "roletfeks_wknode" {
  type        = string
  default = "role_eksworknodetf"
}

variable "role_eksworknodetf_arn" {
  type        = string
  default = "arn:aws:iam::599853486601:role/role_eksworknodetf"

}




variable "roletfeks_server" {
   type = string
   default = "https://F436D09299923FF2EBDBA4D3EEE0E76B.yl4.us-east-1.eks.amazonaws.com"
}


variable "roletfeks_id_cert" {
   type = string
   default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01EVXhOREUxTVRBek1sb1hEVE13TURVeE1qRTFNVEF6TWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTG0yCkhjZm9qdGlVbTEwaVBDcVBUaFJGcGJJSGNqbWxsR2tZWWlxdktOMnBxdTg4NGgvL0ZkL0cwaEpuRkE4c2FWZUwKSVdhbm5HaHJRSjdzNTN4b3dOREtiOW8vZmdUb1NuR0ZXa3hGVzFneEMwUEhKMHJXMUlrczd4YS9xUzRDbVRaUgoreHZUSHZBbGtsZEJpK0d0dmFnL1graS9Odlp0aEFMUVNUZ1FUbnBqQnVOWks2ZHBEcXlOakwvSm15djh3Ri9HCkJTb1pyWFppVGRmOXFua1RmbEtOMTNLd2tCUTFoZ0NkbmVoSXVmTEphVHdYc1gwRUxyYzJnREw4eE05RWFITmgKdzR6UjR5cDhJWWYyeGtqcWpuZjRXc0lTU0hNd1dFMWxQQ1dhQUV4WksrWlFhc1g0RnNnSjFpeFQ5aWVqSVhndwo5YUxlRFZrNExEd1loYUNKMVRzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFCV0NuazJQdU9ISERjZHp5Nit4cUpxUXJTQTIKMXFEQTZWRnU5SjIrYXVVbkI2WjZhTkxSVUNYZ2IzczVWYmVXdFFtY1dOdy9rSXFhQW9udzl6bXhCOFg2bGVsMwp5RjRqZ0VLQjZROGF0akFDL2hXTTdzcU8wWFdwWnZTbFZDZVVldFAwWnJ1MGV2UFhBdy9oLzBKeTg2U0FjdHhhCkVrc1cwQTR4QXEvWDlrck13QUtmNDZ5cDBhcmcxV2ZrajdTTnRqSStSaG5wOUJQUk15T2VIQ1gxcnQveFk4UTAKS3pBWFZvME9ocnZIQzIrMWZZQmZsUkgzcVlKbUh3QW9HdENFYmJnUEJJK3pCM0xVWVZlYmlwVFFybm1JbmRqUQpDZTVaZUozVnJxS3ZPdThDZTFLb2FETTlHbWtLbElCRHg5dy96VFUyNFFSbEVybnJWYlVlbkFZaGxrND0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
}

variable "Iam_attch_AmazonEKSClusterPolicy" {
  description = "attach action  na role Role_Eksterraform"
  type = list(object({
    id  = string
    policy_arn = string
    role   = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515110315658800000002"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
	role = "Role_Eksterraform"
    },
  ]
}



variable "Iam_attch_AmazonEKSServicePolicy" {
  description = "attach action  na role Role_Eksterraform"
  type = list(object({
    id  = string
    policy_arn = string
    role   = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515110315617100000001"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
	role = "Role_Eksterraform"
    },
  ]
}

variable "Iam_attch_AmazonEKSWorkerNodePolicy" {
  description = "attach action  na role Role_Eksterraform"
  type = list(object({
    id  = string
    policy_arn = string
    role   = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515104503561600000001"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
	role = "Role_Eksterraform"
    },
  ]
}


variable "Iam_attach_AmazonEKSWorkerNodePolicy" {
  description = "attach action  na role Role_Eksterraform"
  type = list(object({
    id  = string
    policy_arn = string
    role   = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515104503561600000001"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
	role = "Role_Eksterraform"
    },
  ]
}


variable "Iam_attach_AmazonEKS_CNI_Policy" {
  description = "attach action  na role Role_Eksterraform"
  type = list(object({
    id  = string
    policy_arn = string
    role   = string
  }))

  default = [
    {
	id = "Role_Eksterraform-20200515104503574800000003"
	policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
	role = "Role_Eksterraform"
    },
  ]
}


#####################################################################
variable "cluster_enabled_log_types" {
  default     = []
  description = "A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
}
variable "cluster_log_kms_key_id" {
  default     = ""
  description = "If a KMS Key ARN is set, eks key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
  type        = string
}
variable "cluster_log_retention_in_days" {
  default     = 90
  description = "Number of days to retain log events. Default retention - 90 days."
  type        = number
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
}

variable "cluster_security_group_id" {
  description = "If provided, the EKS cluster will be attached to eks security group. If not given, a security group will be created with necessary ingress/egress to work with the workers"
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default     = "1.14"
}

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

variable "manage_aws_auth" {
  description = "Whether to apply the aws-auth configmap file."
  default     = true
}

variable "write_aws_auth_config" {
  description = "Whether to write the aws-auth configmap file."
  type        = bool
  default     = true
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type        = list(string)
  default     = []
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

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
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


variable "worker_groups" {
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Configurations. See workers_group_defaults for valid keys."
  type        = any
  default     = []
}

variable "workers_group_defaults" {
  description = "Override default values for target groups. See workers_group_defaults_defaults in local.tf for valid keys."
  type        = any
  default     = {}
}

variable "worker_groups_launch_template" {
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Templates. See workers_group_defaults for valid keys."
  type        = any
  default     = []
}

variable "worker_security_group_id" {
  description = "If provided, all workers will be attached to eks security group. If not given, a security group will be created with necessary ingress/egress to work with the EKS cluster."
  type        = string
  default     = ""
}

variable "worker_ami_name_filter" {
  description = "Name filter for AWS EKS worker AMI. If not provided, the latest official AMI for the specified 'cluster_version' is used."
  type        = string
  default     = ""
}

variable "worker_ami_name_filter_windows" {
  description = "Name filter for AWS EKS Windows worker AMI. If not provided, the latest official AMI for the specified 'cluster_version' is used."
  type        = string
  default     = ""
}

variable "worker_ami_owner_id" {
  description = "The ID of the owner for the AMI to use for the AWS EKS workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft')."
  type        = string
  default     = "602401143452" // The ID of the owner of the official AWS EKS AMIs.
}

variable "worker_ami_owner_id_windows" {
  description = "The ID of the owner for the AMI to use for the AWS EKS Windows workers. Valid values are an AWS account ID, 'self' (the current account), or an AWS owner alias (e.g. 'amazon', 'aws-marketplace', 'microsoft')."
  type        = string
  default     = "801119661308" // The ID of the owner of the official AWS EKS Windows AMIs.
}

variable "worker_additional_security_group_ids" {
  description = "A list of additional security group ids to attach to worker instances"
  type        = list(string)
  default     = []
}

variable "worker_sg_ingress_from_port" {
  description = "Minimum port number from which pods will accept communication. Must be changed to a lower value if some pods in your cluster will expose a port lower than 1025 (e.g. 22, 80, or 443)."
  type        = number
  default     = 1025
}

variable "workers_additional_policies" {
  description = "Additional policies to be added to workers"
  type        = list(string)
  default     = []
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

variable "kubeconfig_aws_authenticator_env_variables" {
  description = "Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = \"eks\"}."
  type        = map(string)
  default     = {}
}

variable "kubeconfig_name" {
  description = "Override the default name used for items kubeconfig."
  type        = string
  default     = ""
}

variable "cluster_create_timeout" {
  description = "Timeout value when creating the EKS cluster."
  type        = string
  default     = "15m"
}

variable "cluster_delete_timeout" {
  description = "Timeout value when deleting the EKS cluster."
  type        = string
  default     = "15m"
}

variable "local_exec_interpreter" {
  description = "Command to run for local-exec resources. Must be a shell-style interpreter. If you are on Windows Git Bash is a good choice."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}

variable "cluster_create_security_group" {
  description = "Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id`."
  type        = bool
  default     = false
}

variable "worker_create_security_group" {
  description = "Whether to create a security group for the workers or attach the workers to `worker_security_group_id`."
  type        = bool
  default     = true
}

variable "worker_create_initial_lifecycle_hooks" {
  description = "Whether to create initial lifecycle hooks provided in worker groups."
  type        = bool
  default     = false
}

variable "permissions_boundary" {
  description = "If provided, all IAM roles will be created with eks permissions boundary attached."
  type        = string
  default     = null
}

variable "iam_path" {
  description = "If provided, all IAM roles will be created on eks path."
  type        = string
  default     = "/"
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "manage_cluster_iam_resources" {
  description = "Whether to let the module manage cluster IAM resources. If set to false, cluster_iam_role_name must be specified."
  type        = bool
  default     = false
}

variable "cluster_iam_role_name" {
  description = "IAM role name for the cluster. Only applicable if manage_cluster_iam_resources is set to false."
  type        = string
  default     = "Role_Eksterraform"
}

variable "manage_worker_iam_resources" {
  description = "Whether to let the module manage worker IAM resources. If set to false, iam_instance_profile_name must be specified for workers."
  type        = bool
  default     = true
}

variable "workers_role_name" {
  description = "User defined workers role name."
  type        = string
  default     = ""
}

variable "manage_worker_autoscaling_policy" {
  description = "Whether to let the module manage the cluster autoscaling iam policy."
  type        = bool
  default     = true
}

variable "attach_worker_autoscaling_policy" {
  description = "Whether to attach the module managed cluster autoscaling iam policy to the default worker IAM role. This requires `manage_worker_autoscaling_policy = true`"
  type        = bool
  default     = true
}

variable "attach_worker_cni_policy" {
  description = "Whether to attach the Amazon managed `AmazonEKS_CNI_Policy` IAM policy to the default worker IAM role. WARNING: If set `false` the permissions must be assigned to the `aws-node` DaemonSet pods via another method or nodes will not be able to join the cluster."
  type        = bool
  default     = true
}
