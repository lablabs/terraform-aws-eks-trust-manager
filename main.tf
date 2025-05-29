/**
 * # AWS EKS Trust Manager Terraform module
 *
 * A Terraform module to deploy the [trust-manager](https://cert-manager.io/docs/trust/trust-manager/) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-trust-manager/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-trust-manager/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-trust-manager/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-trust-manager/actions/workflows/pre-commit.yaml)
 */
locals {
  addon = {
    name      = "trust-manager"
    namespace = "kube-system"

    helm_chart_version = "0.16.0"
    helm_repo_url      = "https://charts.jetstack.io"
  }

  addon_values = yamlencode({
    app = {
      trust = {
        namespace = "kube-system"
      }
    }
  })

  addon_depends_on = []
}
