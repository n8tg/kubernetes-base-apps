resource "helm_release" "argocd" {
  depends_on        = [helm_release.istiod]
  name              = "argocd"
  namespace         = "argocd"
  chart             = "argo-cd"
  version           = "5.13.0"
  repository        = "https://argoproj.github.io/argo-helm"
  create_namespace  = true
  dependency_update = true
}