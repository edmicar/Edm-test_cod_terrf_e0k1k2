#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_eks_cluster" "eks" {
  name     = var.cluster-name
  role_arn = var.iam_role_arn_terraform

  vpc_config {
    security_group_ids = [var.sg_cluster]
    subnet_ids         = var.vpc_subnets
  }

  depends_on = [
    var.Iam_attch_AmazonEKSClusterPolicy,
    var.Iam_attch_AmazonEKSServicePolicy,
  ]
}





