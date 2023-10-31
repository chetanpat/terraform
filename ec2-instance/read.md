1. Passing through a file: These variables can be specified in the variable.tf file and call the same in main.tf file

#variable.tf
variable "instance_type" {
    type = string
    default = "t2.micro"
    description
}

#main.tf
resource "aws_instance" "ec2-instance" {
    ami = "ami_ID"
    instance_type = "${var.instance_type}
}

2. Interactive Variable: If you don't provide the value in the variable.tf file, then it ask for the value while calling terraform plan or terraform apply commands

#variable.tf
variable "ami_id" {

}

3. Inline Variables: You can pass the variables through the terraform commands
terraform apply -var instance_type='t2.micro' --auto-approve

4. Map Variables: you can use the map variables in the variable.tf file. Checkout the below example

Map Variable Example-1
#variable.tf
variable "env"{
}
variable "instance_type" {
    type = map(string)
    default = {
        dev = "t2.micro"
        test = "t2.medium"
    }
}

#main.tf 
resource "aws_instance" "ec2-instance" {
    ami = "ami_ID"
    instance_type = "${lookup(var.instance_type,var.env)}"
}

Map Variable Example-2
#variable.tf
variable "ami_type" {
    type = map(string)
    default ={
        us-east-1 = "ami-id"
        us-east-2 = "ami-id"
    }
}
variable "env" {

}
variable "region" {

}
variable "instance_type" {
    type = map(string)
    default = {
        dev = "t2.micro"
        test = "t2.medium"
    }
}

#main.tf
resource "aws_instance" "first_instance" {
    ami = "${lookup(var.ami_type, var.region)}"
    instance_type = ${lookup(var.instance_type, var.env)}"
}

5. List Variable: you can use the list variables in the variable.tf file. It looks like array of values
#variable.tf

variable "security_group" {
    type = list(string)
    default = ["sg-1", "sg-2"]
}
