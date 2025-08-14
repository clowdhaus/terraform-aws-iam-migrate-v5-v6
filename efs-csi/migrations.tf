################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.efs_csi
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.efs_csi
  to   = aws_iam_role_policy_attachment.this
}
