################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.ebs_csi
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.ebs_csi
  to   = aws_iam_role_policy_attachment.this
}
