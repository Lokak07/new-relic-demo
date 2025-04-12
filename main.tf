module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_vpn_gateway   = var.enable_vpn_gateway

  manage_default_security_group  = var.manage_default_security_group
  default_security_group_ingress = var.default_security_group_ingress
  default_security_group_egress  = var.default_security_group_egress

  enable_flow_log                      = var.enable_flow_log
  create_flow_log_cloudwatch_iam_role  = var.create_flow_log_cloudwatch_iam_role
  create_flow_log_cloudwatch_log_group = var.create_flow_log_cloudwatch_log_group

  tags = var.tags
}

# eks cluster module associated with the VPC module
# This module creates an EKS cluster and node groups within the VPC created above

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # Optional
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
 # cluster_compute_config                   = var.cluster_compute_config
  vpc_id                                   = module.vpc.vpc_id
  subnet_ids                               = module.vpc.private_subnets
  tags                                     = var.tags
}



# Create a key pair for SSH access to the EC2 instances in the VPC
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}