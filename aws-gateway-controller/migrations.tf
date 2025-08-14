################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.aws_gateway_controller
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.aws_gateway_controller
  to   = aws_iam_role_policy_attachment.this
}
