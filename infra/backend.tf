terraform {
    backend "s3" {
        bucket = "kandidat2018"
        key = "terraform"
        region = "eu-west-1"
    }
}