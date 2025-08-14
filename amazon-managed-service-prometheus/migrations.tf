################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.amazon_managed_service_prometheus
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.amazon_managed_service_prometheus
  to   = aws_iam_role_policy_attachment.this
}
