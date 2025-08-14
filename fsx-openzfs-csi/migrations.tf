################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.fsx_openzfs_csi
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.fsx_openzfs_csi
  to   = aws_iam_role_policy_attachment.this
}
