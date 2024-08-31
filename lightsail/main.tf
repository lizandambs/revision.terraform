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
  blueprint_id = "amazon_linux_2"
  bundle_id = "nano_3_0"
  key_pair_name = "week2"
  user_data = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>welcome to manager class</h1>' | sudo tee /var/www/html/index.html"
  tags = {
    env = "revision"
  }
  
}
output "public_ip" {
  value = aws_lightsail_instance.server.public_ip_address
  
}
output "private_ip" {
  value = aws_lightsail_instance.server.private_ip_address
  
}
