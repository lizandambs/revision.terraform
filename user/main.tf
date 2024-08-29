terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  # Configuration options
}

resource "aws_iam_user" "user1" {
  name = "evans"
  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_user" "user2" {
    name = "abigael"
    tags = {
      team = "dev"
    }
  
}
resource "aws_iam_group" "groups" {
  name = "freen"
  
}
resource "aws_iam_group_membership" "bila" {
  name = "freen_membership"
  users = [aws_iam_user.user1.name, aws_iam_user.user2.name]
  group = aws_iam_group.groups.name
}