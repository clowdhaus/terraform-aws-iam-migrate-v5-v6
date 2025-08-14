################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.vpc_cni
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.vpc_cni
  to   = aws_iam_role_policy_attachment.this
}
