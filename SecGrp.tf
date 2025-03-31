# Security Group for Public Instance (Allows SSH & HTTP from Anywhere)
resource "aws_security_group" "public_sg" {
  name        = "public-sg"
  description = "Security group for public instance"
  vpc_id      = aws_vpc.main_vpc.id # Ensure it's in the correct VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this to your IP for better security
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Private Instance (Allows Only Internal Access)
resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Security group for private instance"
  vpc_id      = aws_vpc.main_vpc.id # Ensure it's in the correct VPC

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id] # Allow SSH only from Public Instance
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
