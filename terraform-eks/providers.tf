provider "aws" {
  region = local.region
}

locals {
  region   = "ap-south-1"
  name     = "nitin-eks-cluster"
  env      = "dev"
  vpc_cidr = "10.0.0.0/16"

  # Availability Zones
  azs = ["ap-south-1a", "ap-south-1b"]

  # Clean IP Partitioning (/24 gives 256 IPs per subnet)
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  intra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]

  tags = {
    Project     = local.name
    Environment = local.env
    Terraform   = "true"
  }
}
