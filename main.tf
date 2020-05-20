module "eks-node-wrk" {
  source             = "./aws-modules/eks-node-wrk/aws"
  cluster_name       = var.cluster-name
  subnets = var.vpc_subnets

    map_roles = [
    {
      rolearn  = "arn:aws:iam::599853486601:role/Role_Eksterraform"
      username = "Role_Eksterraform"
      groups   = ["system:masters"]
    },
  ]
}


