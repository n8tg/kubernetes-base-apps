resource "helm_release" "cert-manager" {
  depends_on        = [helm_release.istiod]
  name              = "cert-manager"
  namespace         = "cert-manager"
  chart             = "cert-manager"
  version           = "v1.10.1"
  repository        = "https://charts.jetstack.io"
  create_namespace  = true
  dependency_update = true
}