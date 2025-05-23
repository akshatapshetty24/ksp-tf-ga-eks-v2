terraform {
  backend "s3" {
    bucket         = "ksp-tf-ga-eks-v2-terraform-state-bucket"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ksp-tf-ga-eks-v2-terraform-locks"
    encrypt        = true
  }
}
