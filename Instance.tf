resource "aws_instance" "web" {
  count         = 2
  ami           = data.aws_ami.amiID.id
  instance_type = var.instance_type
  key_name      = "dove-key"

  # Assign instances to the correct subnet
  subnet_id = count.index == 0 ? aws_subnet.public_subnet.id : aws_subnet.private_subnet.id

  # Use the correct security groups
  vpc_security_group_ids = [count.index == 0 ? aws_security_group.public_sg.id : aws_security_group.private_sg.id]

  tags = {
    Name    = count.index == 0 ? "Dove-Public" : "Dove-Private"
    Project = "Dove"
  }
}
