variable "service_name" {
    description = "Name of AppRunner service"
    type = string
    default = "2018_service"
}

variable "aws_iam_policy"{
    description = "IAM policy name"
    type = string
}

variable "aws_apprunner_role"{
    description = "iam role name"
    type = string
}

variable "ecr_repo"{
    description = "url to ecr_repo"
    type = string
}