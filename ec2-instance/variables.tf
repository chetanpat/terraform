variable "ami_type" {
  type = map(string)
  default = {
     "us-east-1" = "ami-0fc5d935ebf8bc3bc"
     "us-east-2" = "ami-08cba41c585e4a2e2"
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