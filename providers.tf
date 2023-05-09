terraform {
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
         access_key = "AKIAQNTLOUGAIULBQZSB"
         secret_key = "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"
	 region = "us-east-1"
        #profile = "Vikash"
        }


