resource "helm_release" "cert-manager" {
  depends_on        = [helm_release.istio-base]
  name              = "cert-manager"
  namespace         = "cert-manager"
  chart             = "cert-manager"
  version           = "0.1.2"
  repository        = "https://helm.nategramer.com"
  create_namespace  = true
  dependency_update = true
  set {
    name  = "installCRDs"
    value = "true"
  }
}