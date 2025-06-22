#create public servers

resource "aws_instance" "dev" {
    ami = "ami-0b09627181c8d5778"
    instance_type = "t2.micro"
    key_name = "31may"
    subnet_id = aws_subnet.public.id
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    tags = {
      Name = "dev_ec2"
    }
  
}
