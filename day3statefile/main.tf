resource "aws_instance" "dev" {
    ami = "ami-09e6f87a47903347c"
    instance_type = "t2.micro"
    key_name = "uskey"
    # availability_zone = "ap-south-1b"
    # tags = {
    #     Name = "dev"
    # }
  
}