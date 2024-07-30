variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}
variable "ami_id" {
  description = "The AMI ID of the EC2"
  default = "ami-0427090fd1714168b"
}
variable "aws_access_key"{
    description = "The AWS access key to connect to an AWS account"
}

variable "aws_secret_key"{
    description = "The AWS secret key to connect to an AWS account"
}

variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  default     = "python3.8"
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  default     = "lambda_function.lambda_handler"
}
