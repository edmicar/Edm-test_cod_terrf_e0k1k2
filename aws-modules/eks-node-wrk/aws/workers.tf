# Worker Groups using Launch Configurations


resource "aws_eks_node_group" "eks-node-wrk" {
  cluster_name    = var.cluster-name
  node_group_name = "work_station1"
  instance_types  = ["t2.medium"]
  node_role_arn   = var.iam_role_arn_terraform
  subnet_ids      = var.vpc_subnets



  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  depends_on = [
    var.Iam_attch_AmazonEKSWorkerNodePolicy,
    var.Iam_attach_AmazonEKSWorkerNodePolicy,
    var.Iam_attach_AmazonEKSWorkerNodePolicy,
  ]
}
