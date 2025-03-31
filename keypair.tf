resource "aws_key_pair" "dove_key" {
  key_name   = "dove-key"
  public_key = file("C:/Users/user/.ssh/dove-key.pub")
}