terraform {
    backend "s3" {
        bucket         	   = "joshcaz-tf-state"
        key                = "state/terraform.tfstate"
        region         	   = "us-east-1"
        encrypt        	   = true
        dynamodb_table = "tf-remote-state-lock"
    }
}