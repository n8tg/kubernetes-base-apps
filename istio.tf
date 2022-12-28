resource "helm_release" "istio-base" {
  name              = "istio-base"
  namespace         = "istio-system"
  chart             = "base"
  version           = "1.16.1"
  repository        = "https://istio-release.storage.googleapis.com/charts"
  create_namespace  = true
  dependency_update = true
}

resource "helm_release" "istiod" {
  depends_on        = [helm_release.istio-base]
  name              = "istiod"
  namespace         = "istio-system"
  chart             = "istiod"
  version           = "1.16.1"
  repository        = "https://istio-release.storage.googleapis.com/charts"
  create_namespace  = true
  dependency_update = true
}

resource "helm_release" "istio-ingressgateway" {
  depends_on        = [helm_release.istiod]
  name              = "istio-ingressgateway"
  namespace         = "istio-ingressgateway"
  chart             = "gateways"
  version           = "1.16.1"
  repository        = "https://istio-release.storage.googleapis.com/charts"
  create_namespace  = true
  dependency_update = true
}
