resource "aws_instance" "multiple_ec2" {
  count = 1
  ami = "${lookup(var.ami_type, var.region)}"
  instance_type = "${lookup(var.instance_type, var.env)}"

  tags = {
    name = "instance_${count.index}"
  }
}

