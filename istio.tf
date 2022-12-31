resource "helm_release" "istio-base" {
  name              = "istio-base"
  namespace         = "istio-system"
  chart             = "istio"
  version           = "0.1.4"
  repository        = "https://helm.nategramer.com"
  create_namespace  = true
  dependency_update = true
  set {
    name  = "clusterIngressDomain"
    value = var.cluster_ingress_domain
  }
}

resource "helm_release" "istio-ingressgateway" {
  depends_on        = [helm_release.istio-base]
  name              = "istio-ingressgateway"
  namespace         = "istio-ingressgateway"
  chart             = "istio-ingressgateway"
  version           = "0.1.3"
  repository        = "https://helm.nategramer.com"
  create_namespace  = true
  dependency_update = true
  set {
    name  = "clusterIngressDomain"
    value = var.cluster_ingress_domain
  }
}
