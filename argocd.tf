resource "helm_release" "argocd" {
  depends_on        = [helm_release.istio-base]
  name              = "argocd"
  namespace         = "argocd"
  chart             = "argo-cd"
  version           = "0.1.4"
  repository        = "https://helm.nategramer.com"
  create_namespace  = true
  dependency_update = true
}