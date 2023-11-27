variable "service_name" {
    description = "Name of AppRunner service"
    type = string
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

#variable "dashboard_name"{
#    description = "name of the dashbboard"
#    type = string
#    default = "My_dashboard"
#}

#variable "alert_email"{
#    description = "email the alarm gets sent to"
#    type = string
#}