resource "local_file" "config_map_aws_auth" {
  count    = var.write_aws_auth_config ? 1 : 0
  content  = data.template_file.config_map_aws_auth.rendered
  filename = "${var.config_output_path}config-map-aws-auth_${var.cluster_name}.yaml"
}

resource "null_resource" "update_config_map_aws_auth" {
  count      = var.manage_aws_auth ? 1 : 0
  depends_on = [aws_eks_cluster.eks]

  provisioner "local-exec" {
    working_dir = path.module

    command = <<EOS
completed_apply=0
for i in `seq 1 10`; do \
echo "${null_resource.update_config_map_aws_auth[0].triggers.kube_config_map_rendered}" > kube_config.yaml && \
echo "${null_resource.update_config_map_aws_auth[0].triggers.config_map_rendered}" > aws_auth_configmap.yaml && \
kubectl apply -f aws_auth_configmap.yaml --kubeconfig kube_config.yaml && \
completed_apply=1 && break || \
sleep 10; \
done; \
#rm aws_auth_configmap.yaml kube_config.yaml;
kubectl get svc
if [ "$completed_apply" = "0" ]; then exit 1; fi;
EOS


    interpreter = var.local_exec_interpreter
  }

  triggers = {
    kube_config_map_rendered = data.template_file.kubeconfig.rendered
    config_map_rendered      = data.template_file.config_map_aws_auth.rendered
    endpoint                 = aws_eks_cluster.eks.endpoint
  }
}

data "aws_caller_identity" "current" {
}

data "template_file" "launch_template_worker_role_arns" {
  count    = 0
  template = file("${path.module}/templates/worker-role.tpl")

  vars = {
    worker_role_arn = var.iam_role_arn_terraform
    }
  }


data "template_file" "worker_role_arns" {

  vars = {
    worker_role_arn = var.iam_role_arn_terraform
    }
  }

data "template_file" "config_map_aws_auth" {
  template = file("${path.module}/templates/config-map-aws-auth.yaml.tpl")

  vars = {
    worker_role_arn = join(
      "",
      distinct(
        concat(
          data.template_file.launch_template_worker_role_arns.*.rendered,
          data.template_file.worker_role_arns.*.rendered,
        ),
      ),
    )
    map_users    = yamlencode(var.map_users),
    map_roles    = yamlencode(var.map_roles),
    map_accounts = yamlencode(var.map_accounts)
  }
}
