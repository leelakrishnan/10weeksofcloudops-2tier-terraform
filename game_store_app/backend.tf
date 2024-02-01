terraform {
  backend "s3" {
    bucket = "843715177247.tfstate"
    key = "backend/10weeksofcloudops-2tier-gamestore.tfstate"
    region = "us-east-2"
    dynamodb_table = "tfstate-lock"
  }
}