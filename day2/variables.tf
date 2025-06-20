variable "ami" {
  description = "from ami"
  type        = string
  default     = ""

}
variable "type" {
  type    = string
  default = "t2.nano"

}
variable "key" {
  type    = string
  default = ""

}