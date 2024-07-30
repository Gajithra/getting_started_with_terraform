# Create EventBridge Rule
resource "aws_cloudwatch_event_rule" "example" {
  name        = "example_rule"
  description = "EventBridge rule to trigger Lambda"
  schedule_expression = "rate(5 minutes)"
}

# Create EventBridge Target
resource "aws_cloudwatch_event_target" "example" {
  rule      = aws_cloudwatch_event_rule.example.name
  target_id = "lambda_target"
  arn       = aws_lambda_function.example.arn
}

# Add permission for EventBridge to invoke Lambda
resource "aws_lambda_permission" "eventbridge_lambda" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.example.arn
}
