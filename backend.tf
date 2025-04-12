terraform {
  backend "s3" {
    bucket         = "my-secure-terraform-state-shakthi"
    key            = "vpc/terraform.tfstate1"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

