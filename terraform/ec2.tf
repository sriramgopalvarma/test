resource "aws_instance" "web" {
  ami           = "ami-0062dbf6b829f04e1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
