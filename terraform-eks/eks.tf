module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  # Cluster configuration
  name                    = local.name
  kubernetes_version      = "1.35"
  endpoint_public_access  = true
  endpoint_private_access = true


  enable_cluster_creator_admin_permissions = true

  # Networking attachments
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets


  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true
    }
    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true
    }
  }


  eks_managed_node_groups = {
    nitin-app-ng = {
      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      tags = {
        NodeGroup = "managed-spot-nodes"
      }
    }
  }

  tags = local.tags
}
