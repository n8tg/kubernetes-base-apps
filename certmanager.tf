resource "helm_release" "cert-manager" {
  depends_on        = [helm_release.istiod]
  name              = "cert-manager"
  namespace         = "cert-manager"
  chart             = "cert-manager"
  version           = "1.16.1"
  repository        = "https://charts.jetstack.io"
  create_namespace  = true
  dependency_update = true
}