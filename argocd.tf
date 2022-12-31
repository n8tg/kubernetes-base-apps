resource "helm_release" "argocd" {
  depends_on        = [helm_release.istio-base, helm_release.cert-manager]
  name              = "argocd"
  namespace         = "argocd"
  chart             = "argo-cd"
  version           = "0.1.7"
  repository        = "https://helm.nategramer.com"
  create_namespace  = true
  dependency_update = true
  set {
    name  = "clusterIngressDomain"
    value = var.cluster_ingress_domain
  }
}