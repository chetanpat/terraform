resource "aws_instance" "multiple_ec2" {
  count = 2
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"

  tags = {
    name = "instance_${count.index}"
  }
}