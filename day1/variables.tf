variable "ami_id" {
    description = "inserting ami value from main.tf"  # optional
    type= string
    default = "ami-09e6f87a47903347c"
  
}

variable "type" {
    type = string
    default = "t2.micro"
  
}
variable "keyname" {
    type = string
    default = "uskey"
  
}