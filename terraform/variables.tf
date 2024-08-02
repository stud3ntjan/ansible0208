variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_session_token" {}

variable "region" {
  default = "eu-central-1"
}
variable "ami" {
  default = "ami-013efd7d9f40467af"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {}
