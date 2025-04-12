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

  manage_default_security_group = var.manage_default_security_group
  default_security_group_ingress = var.default_security_group_ingress
  default_security_group_egress  = var.default_security_group_egress

  enable_flow_log                         = var.enable_flow_log
  create_flow_log_cloudwatch_iam_role     = var.create_flow_log_cloudwatch_iam_role
  create_flow_log_cloudwatch_log_group    = var.create_flow_log_cloudwatch_log_group

  tags = var.tags
}
