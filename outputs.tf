output "ec2_instance_id" {
  value = aws_instance.example.id
}

output "lambda_function_name" {
  value = aws_lambda_function.example.function_name
}

output "api_gateway_url" {
  value = "${aws_api_gateway_rest_api.example.execution_arn}/example"
}

output "eventbridge_rule_name" {
  value = aws_cloudwatch_event_rule.example.name
}
