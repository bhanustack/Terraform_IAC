resource "aws_instance" "example1" {
    ami =  "ami-0cfde0ea8edd312d4"
    instance_type = "t3.micro"
  
tags = {
  Name = "terraform-example4"
  BU = "Energy2"
  FINID = "1431"
  Manager = "Sunil"
  Patch = "yes"
}
}
