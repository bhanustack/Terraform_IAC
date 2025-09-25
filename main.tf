resource "aws_instance" "example1" {
    ami =  "ami-0cfde0ea8edd312d4"
    instance_type = "t3.micro"
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    user_data_replace_on_change = true
  
tags = {
  Name = "terraform-example4"
  
}
}
