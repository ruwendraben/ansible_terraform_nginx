provider "aws" {
  access_key = "add_here"
  secret_key = "add_here"
  region     = "ap-southeast-2"
}

resource "aws_instance" "ansible-tf-excetel" {
  ami           = "ami-01c6a7a360e19ae72"
  instance_type = "t2.micro"

}

data "external" "get_pub_ip" {
  program = ["sh", "pub.sh"]
}

output "commandout" {
  value = data.external.get_pub_ip.result
}
