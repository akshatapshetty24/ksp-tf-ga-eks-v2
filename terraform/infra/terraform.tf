terraform {
  backend "s3" {
    bucket         = "ksp-tf-ga-eks-v2-terraform-state-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    #region = var.aws_region
    dynamodb_table = "ksp-tf-ga-eks-v2-terraform-locks"
    encrypt        = true
  }
}
