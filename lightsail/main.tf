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
resource "aws_lightsail_instance" "server" {
  name = "webserver"
  availability_zone = "us-east-1a"
  blueprint_id = "debian_12"
  bundle_id = "nano_3_0"
  key_pair_name = "haproxy"
  tags = {
    env = "revision"
  }
  
}