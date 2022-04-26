# locals {
#  region = ["us-east-1","us-east-2","us-west-1","us-west-2"]
# av_zones = ["us-east-1a","us-east-2a","us-west-1a","us-west-2a"]
# cidrs = ["10.0.0.0/16","10.0.1.0/24","10.0.2.0/24"]
# }

# output "region" {
#   value = local.region
# }
# output "av_zones" {
#   value = local.av_zones
# }
# output "cidrs" {
#   value = local.cidrs
# }


# locals {
#   user = ["admin","developer","devops"]
# }
# variable "user_name" {
#   type = list
#   default = ["David", "Tom", "Roman","Erxhan","dev", "Opsteam"]
# }

# resource "aws_iam_user" "name1" {
# count = length(var.user_name)
# name = element(var.user_name, count.index)
# }

# output "users" {
#   value = aws_iam_user.name1[*].name
# }


# resource "aws_default_vpc" "name" {
#     tags = {
#     Name = "name"
#   }
# }

# locals {
#   #ports = [443, 80, 22, 3306, 3389, 53]
# map = {
#     "HTTPS" = {
#         port = 443,
#         protocol = "tcp",
#         cidr_blocks =["10.1.0.0/16"]

#     }
#     "HTTP" = {
#         port = 80,
#         protocol = "udp",
#         cidr_blocks =["20.0.1.0/24"]
#     }
#     "SSH" = {
#         port = 22,
#         protocol = "tls",
#         cidr_blocks=["10.0.1.0/24"]
#     }
# }

# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_default_vpc.name.id


#  dynamic "ingress" {
#      for_each = local.map
#      content {
#     description      = ingress.key
#     from_port        = ingress.value.port
#     to_port          = ingress.value.port
#     protocol         = ingress.value.protocol
#     cidr_blocks      = ingress.value.cidr_blocks
#      }
#  }

#    egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }


# variable "tags" {
#   type = map(any)
#   default = {
#     "Name"      = "Database-Server"
#     "ENV"       = "PROD"
#     "PATCHING"  = "Linux"
#     "Owner"     = "Amazon"
#   }
# }


# output "merge" {
#   value = merge("${var.tags}", {DEPARTMENT = "Finance"}, {CreatedBy = "Terraform"})
# }

# output "look_up" {
#   value = lookup (var.tags , "Name", "Defaul_name")
# }

# data "aws_caller_identity" "current" {}

# variable "account_id" {
#   default = data.aws_caller_identity.current.account_id
# }

# locals {
#   account_id = data.aws_caller_identity.current.account_id
# }



# resource "aws_s3_bucket" "test_bucket" {
#   bucket = "application-bucket-${local.account_id}"
# }


