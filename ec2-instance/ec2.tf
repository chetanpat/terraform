resource "aws_instance" "first_instance" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"

  tags = {
    name = "first_instance" #First Instance
  }
}
