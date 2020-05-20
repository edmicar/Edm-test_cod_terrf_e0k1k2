#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "custom-cluster" {
  name = "terraform-eks-custom-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "custom-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.custom-cluster.name
}

resource "aws_iam_role_policy_attachment" "custom-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.custom-cluster.name
}

resource "aws_security_group" "custom-cluster" {
  name        = "terraform-eks-custom-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.custom.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-eks-custom"
  }
}

resource "aws_security_group_rule" "custom-cluster-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.custom-cluster.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "custom" {
  name     = var.cluster-name
  role_arn = aws_iam_role.custom-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.custom-cluster.id]
    subnet_ids         = aws_subnet.custom[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.custom-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.custom-cluster-AmazonEKSServicePolicy,
  ]
}
#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#

resource "aws_iam_role" "custom-node" {
  name = "terraform-eks-custom-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "custom-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.custom-node.name
}

resource "aws_iam_role_policy_attachment" "custom-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.custom-node.name
}

resource "aws_iam_role_policy_attachment" "custom-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.custom-node.name
}

