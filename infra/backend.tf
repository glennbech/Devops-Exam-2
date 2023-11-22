terraform {
    backend "s3" {
        bucket = "2018terraform"
        key = "terraform"
        region = "eu-west-1"
    }
}