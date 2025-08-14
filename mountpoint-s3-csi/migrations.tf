################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.mountpoint_s3_csi
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.mountpoint_s3_csi
  to   = aws_iam_role_policy_attachment.this
}
