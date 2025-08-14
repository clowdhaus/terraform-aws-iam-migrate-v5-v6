################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.load_balancer_controller
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.load_balancer_controller
  to   = aws_iam_role_policy_attachment.this
}
