
data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig.tpl")

  vars = {
    kubeconfig_name           = var.kubeconfig_name == "" ? "eks_${var.cluster_name}" : var.kubeconfig_name
    endpoint                  = aws_eks_cluster.eks.endpoint
    cluster_auth_base64       = aws_eks_cluster.eks.certificate_authority[0].data
    aws_authenticator_command = var.kubeconfig_aws_authenticator_command
    aws_authenticator_command_args = length(var.kubeconfig_aws_authenticator_command_args) > 0 ? "        - ${join(
      "\n        - ",
      var.kubeconfig_aws_authenticator_command_args,
      )}" : "        - ${join(
      "\n        - ",
      formatlist("\"%s\"", ["token", "-i", "${aws_eks_cluster.eks.name}"]),
    )}"
    aws_authenticator_additional_args = length(var.kubeconfig_aws_authenticator_additional_args) > 0 ? "        - ${join(
      "\n        - ",
      var.kubeconfig_aws_authenticator_additional_args,
    )}" : ""
    aws_authenticator_env_variables = length(var.kubeconfig_aws_authenticator_env_variables) > 0 ? "      env:\n${join(
      "\n",
      data.template_file.aws_authenticator_env_variables.*.rendered,
    )}" : ""
  }
}

data "template_file" "aws_authenticator_env_variables" {
  count = length(var.kubeconfig_aws_authenticator_env_variables)

  template = <<EOF
        - name: $${key}
          value: $${value}
EOF


  vars = {
    value = values(var.kubeconfig_aws_authenticator_env_variables)[count.index]
    key   = keys(var.kubeconfig_aws_authenticator_env_variables)[count.index]
  }
}

#data "aws_iam_role" "eks_cluster_iam_role" {
#  count = var.manage_cluster_iam_resources ? 0 : 1
#  name  = var.cluster_iam_role_name
#}


