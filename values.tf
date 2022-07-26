locals {
  values_default = yamlencode({
    "app" : {
      "trust" : {
        "namespace" : "kube-system"
      }
    }
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values_default,
    var.values
  ])
}
