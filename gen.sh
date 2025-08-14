#!/usr/bin/env sh

BASE_URL='https://raw.githubusercontent.com/terraform-aws-modules/terraform-aws-iam/refs/tags/v6.1.0/modules/iam-role-for-service-accounts'

FILES_TO_COPY=(
  'main.tf'
  'outputs.tf'
  'policies.tf'
  'variables.tf'
  'versions.tf'
  'README.md'
)

POLICIES_TO_MIGRATE=(
  'aws_gateway_controller'
  'cert_manager'
  'cluster_autoscaler'
  'ebs_csi'
  'efs_csi'
  'mountpoint_s3_csi'
  'external_dns'
  'external_secrets'
  'fsx_lustre_csi'
  'fsx_openzfs_csi'
  'load_balancer_controller'
  'load_balancer_controller_targetgroup_only'
  'amazon_managed_service_prometheus'
  'node_termination_handler'
  'velero'
  'vpc_cni'
)

# Download files once
mkdir -p files
for FILE in "${FILES_TO_COPY[@]}"; do
    curl -o "files/${FILE}" "$BASE_URL/${FILE}"
done

# Create one sub-module per policy
for POLICY in "${POLICIES_TO_MIGRATE[@]}"; do
    dirname="$(echo "$POLICY" | sed 's/_/-/g')"
    rm -rf $dirname
    cp -r files $dirname

    cat > "${dirname}/migrations.tf" <<EOF
################################################################################
# Migrations: v5.60 -> v6.0
################################################################################

moved {
  from = aws_iam_policy.${POLICY}
  to   = aws_iam_policy.this
}

moved {
  from = aws_iam_role_policy_attachment.${POLICY}
  to   = aws_iam_role_policy_attachment.this
}
EOF

done
