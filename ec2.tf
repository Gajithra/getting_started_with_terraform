
# IAM role
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policy to EC2 role
resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2_policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:TerminateInstances"
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Create IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

# Create EC2 Instance
resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.id
  depends_on = [ aws_iam_instance_profile.ec2_instance_profile ]
}