variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway across all AZs"
  type        = bool
}

variable "one_nat_gateway_per_az" {
  description = "Create one NAT Gateway per AZ"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS support in VPC"
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Enable VPN gateway"
  type        = bool
}

variable "manage_default_security_group" {
  description = "Allow Terraform to manage the default security group"
  type        = bool
}

variable "default_security_group_ingress" {
  description = "Default security group ingress rules"
  type        = list(any)
  default     = []
}

variable "default_security_group_egress" {
  description = "Default security group egress rules"
  type        = list(any)
  default     = []
}

variable "enable_flow_log" {
  description = "Enable VPC Flow Logs"
  type        = bool
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Create IAM Role for Flow Logs"
  type        = bool
}

variable "create_flow_log_cloudwatch_log_group" {
  description = "Create CloudWatch Log Group for Flow Logs"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

#variables for eks module
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
  default     = true

}

variable "enable_cluster_creator_admin_permissions" {
  description = "Enable admin permissions for the cluster creator"
  type        = bool
  default     = true
}

  # variable "cluster_compute_config" {
  #   description = "Compute configuration for the EKS cluster"
  #   type = list(object({
  #     name          = string
  #     instance_type = string
  #     desired_size  = number
  #     min_size      = number
  #     max_size      = number
  #     volume_size   = number
  #     key_name      = string
  #     tags          = map(string)
  #   }))
  # }

# key pair information for associating with the EC2 instances in the VPC

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
  default     = "deployer-key"
}

variable "public_key" {
  description = "The public SSH key to be used"
  type        = string
}


