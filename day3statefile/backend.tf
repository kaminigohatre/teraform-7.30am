terraform {
  backend "s3" {
    bucket         = "fgftyhbb"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
} 