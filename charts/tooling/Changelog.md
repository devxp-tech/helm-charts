# Change Log

## Next Release 

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :robot: Update Docs 
* :robot: Update Docs 
* [ci skip] :robot: [github actions actor] - Update Docs 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 
* [skip ci] :robot: Update Docs :zap: 
* [devxp-app] :rocket: Add env and envFrom 0.1.25 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 693f28b..e133760 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -103,4 +103,8 @@ promtail:
 
 prometheus:
   enabled: true
-  namespace: monitoring
\ No newline at end of file
+  namespace: monitoring
+
+alertmanager:
+  enabled: true
+  namespace: monitoring
```

## 0.1.28 

**Release date:** 2022-08-26

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [GitOps] :💡: Test Helm + Kustomize 

### Default value changes

```diff
# No changes in this release
```

## 1.20.0 

**Release date:** 2022-08-26

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [GitOps] :💡: Test Helm + Kustomize 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index d8e6b22..693f28b 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -62,7 +62,7 @@ certManager:
   namespace: cert-manager
 
 loki:
-  enabled: true
+  enabled: false
   namespace: monitoring
   values:
     fullnameOverride: loki
```

## 0.1.27 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: Add ExtraArgs 0.1.26 
* [skip ci] :robot: Update Docs :zap: 
* [apps] :mag: Add ExtraArgs 0.1.26 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 62963f4..d8e6b22 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -92,8 +92,8 @@ metricsServer:
   values:
     fullnameOverride: metrics-server
     extraArgs:
-    - --kubelet-insecure-tls=true
-    - --kubelet-preferred-address-types=InternalIP
+      - --kubelet-insecure-tls=true
+      - --kubelet-preferred-address-types=InternalIP
 
 promtail:
   enabled: true
```

## 0.1.26 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: Add ExtraArgs 0.1.26 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 8aa04f1..62963f4 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -91,6 +91,9 @@ metricsServer:
   namespace: kube-system
   values:
     fullnameOverride: metrics-server
+    extraArgs:
+    - --kubelet-insecure-tls=true
+    - --kubelet-preferred-address-types=InternalIP
 
 promtail:
   enabled: true
```

## 0.1.25 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: fix chart.yaml 0.1.25 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.24 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: kube-state-metrics 0.1.24 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.23 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: kube-state-metrics 0.1.23 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 10cc197..8aa04f1 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -81,10 +81,10 @@ kiali:
       namespace: kiali-operator
 
 kubeStateMetrics:
-  enabled: false
-#   namespace: kube-system
-#   values:
-#     fullnameOverride: kube-state-metrics
+  enabled: true
+  namespace: kube-system
+  values:
+    fullnameOverride: kube-state-metrics
 
 metricsServer:
   enabled: true
```

## 0.1.22 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: metrics-server 0.1.22 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.21 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add metrics-server 0.1.21 
* [skip ci] :robot: Update Docs :zap: 
* [apps] :mag: rm monitoring add kube-state-metrics 0.1.18 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index bcdb5d1..10cc197 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -80,17 +80,17 @@ kiali:
       create: true
       namespace: kiali-operator
 
-# kubeStateMetrics:
-#   enabled: false
+kubeStateMetrics:
+  enabled: false
 #   namespace: kube-system
 #   values:
 #     fullnameOverride: kube-state-metrics
 
-# metricsServer:
-#   enabled: false
-#   namespace: kube-system
-#   values:
-#     fullnameOverride: metrics-server
+metricsServer:
+  enabled: true
+  namespace: kube-system
+  values:
+    fullnameOverride: metrics-server
 
 promtail:
   enabled: true
```

## 0.1.20 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add metrics-server 0.1.17 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 3f85ed7..bcdb5d1 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -80,17 +80,17 @@ kiali:
       create: true
       namespace: kiali-operator
 
-kubeStateMetrics:
-  enabled: false
-  namespace: kube-system
-  values:
-    fullnameOverride: kube-state-metrics
+# kubeStateMetrics:
+#   enabled: false
+#   namespace: kube-system
+#   values:
+#     fullnameOverride: kube-state-metrics
 
-metricsServer:
-  enabled: false
-  namespace: kube-system
-  values:
-    fullnameOverride: metrics-server
+# metricsServer:
+#   enabled: false
+#   namespace: kube-system
+#   values:
+#     fullnameOverride: metrics-server
 
 promtail:
   enabled: true
```

## 0.1.19 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add metrics-server 0.1.17 
* Merge branch 'main' of github.com:devxp-tech/helm-charts 
* [apps] :mag: rm monitoring add metrics-server 0.1.17 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 8aa04f1..3f85ed7 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -81,13 +81,13 @@ kiali:
       namespace: kiali-operator
 
 kubeStateMetrics:
-  enabled: true
+  enabled: false
   namespace: kube-system
   values:
     fullnameOverride: kube-state-metrics
 
 metricsServer:
-  enabled: true
+  enabled: false
   namespace: kube-system
   values:
     fullnameOverride: metrics-server
```

## 0.1.18 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add metrics-server 0.1.17 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index abbe748..8aa04f1 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -80,6 +80,12 @@ kiali:
       create: true
       namespace: kiali-operator
 
+kubeStateMetrics:
+  enabled: true
+  namespace: kube-system
+  values:
+    fullnameOverride: kube-state-metrics
+
 metricsServer:
   enabled: true
   namespace: kube-system
```

## 0.1.17 

**Release date:** 2022-08-04

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add metrics-server 0.1.17 
* [skip ci] :robot: Update Docs :zap: 
* Merge branch 'main' of github.com:devxp-tech/helm-charts 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index fc134f2..abbe748 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -78,7 +78,13 @@ kiali:
     releaseName: kiali-operator
     cr:
       create: true
-      namespace: istio-system
+      namespace: kiali-operator
+
+metricsServer:
+  enabled: true
+  namespace: kube-system
+  values:
+    fullnameOverride: metrics-server
 
 promtail:
   enabled: true
```

## 0.1.16 

**Release date:** 2022-08-04

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add kiali 0.1.16 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 80eb0f5..fc134f2 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -7,6 +7,7 @@ global:
     cluster:
       name: "in-cluster"
       server: "https://kubernetes.default.svc"
+      domain: ".diegoluisi.eti.br"
     project: default
 
 sealedSecrets:
@@ -69,6 +70,16 @@ loki:
       dnsService: coredns
       clusterDomain: lgsk8sp1.grupologos.local
 
+kiali:
+  enabled: true
+  namespace: kiali-operator
+  values:
+    includeCRDs: true
+    releaseName: kiali-operator
+    cr:
+      create: true
+      namespace: istio-system
+
 promtail:
   enabled: true
   namespace: monitoring
```

## 0.1.15 

**Release date:** 2022-08-04

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: add promtail 0.1.15 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index b21dab3..80eb0f5 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -69,6 +69,12 @@ loki:
       dnsService: coredns
       clusterDomain: lgsk8sp1.grupologos.local
 
+promtail:
+  enabled: true
+  namespace: monitoring
+  values:
+    fullnameOverride: promtail
+
 prometheus:
   enabled: true
   namespace: monitoring
\ No newline at end of file
```

## 0.1.14 

**Release date:** 2022-08-04

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add loki 0.1.14 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.13 

**Release date:** 2022-08-04

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [apps] :mag: rm monitoring add loki 0.1.13 
* [apps] :mag: rm monitoring add loki 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.12 

**Release date:** 2022-08-04

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [charts] :mag: add Loki 
* :zap: 
* :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 1ee2adb..b21dab3 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -25,6 +25,8 @@ istioGateway:
   namespace: istio-ingress
   public:
     enabled: true
+    # -- this prop is used to inject values to gateway in public chart
+    values: {}
     gateway:
       servers: []
       # - port:
@@ -58,6 +60,15 @@ certManager:
   enabled: true
   namespace: cert-manager
 
+loki:
+  enabled: true
+  namespace: monitoring
+  values:
+    fullnameOverride: loki
+    global:
+      dnsService: coredns
+      clusterDomain: lgsk8sp1.grupologos.local
+
 prometheus:
   enabled: true
   namespace: monitoring
\ No newline at end of file
```

## 0.1.11 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :tractor: removing https from public 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index b91545f..1ee2adb 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -26,16 +26,16 @@ istioGateway:
   public:
     enabled: true
     gateway:
-      servers:
-      - port:
-          number: 443
-          name: https
-          protocol: HTTPS
-        tls:
-          mode: SIMPLE
-          credentialName: istio-certs
-        hosts:
-          - "*.diegoluisi.eti.br"
+      servers: []
+      # - port:
+      #     number: 443
+      #     name: https
+      #     protocol: HTTPS
+      #   tls:
+      #     mode: SIMPLE
+      #     credentialName: istio-certs
+      #   hosts:
+      #     - "*.diegoluisi.eti.br"
   private:
     enabled: true
     values:
```

## 0.1.10 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: 
* :zap: tooling 

### Default value changes

```diff
# No changes in this release
```

## 0.1.9 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: bump tooling 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.8 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :tractor: update tooling update 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index dbcf9d9..b91545f 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -25,10 +25,6 @@ istioGateway:
   namespace: istio-ingress
   public:
     enabled: true
-    # values:
-    #   service:
-    #     annotations:
-    #       alb.ingress.kubernetes.io/scheme: internet-facing
     gateway:
       servers:
       - port:
```

## 0.1.7 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [resume] :building_construction: fix Technologies 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 4ee3fa8..dbcf9d9 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -25,10 +25,10 @@ istioGateway:
   namespace: istio-ingress
   public:
     enabled: true
-    values:
-      service:
-        annotations:
-          alb.ingress.kubernetes.io/scheme: internet-facing
+    # values:
+    #   service:
+    #     annotations:
+    #       alb.ingress.kubernetes.io/scheme: internet-facing
     gateway:
       servers:
       - port:
```

## 0.1.6 

**Release date:** 2022-08-03

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [resume] :building_construction: fix Technologies 

### Default value changes

```diff
# No changes in this release
```

## 0.1.5 

**Release date:** 2022-08-02

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat: update istio gateway in tooling 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 7702c42..4ee3fa8 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -22,12 +22,15 @@ istiod:
   namespace: istio-system
 
 istioGateway:
-  enabled: true
   namespace: istio-ingress
-  gateways:
-    public:
-      enabled: true
-      servers: []
+  public:
+    enabled: true
+    values:
+      service:
+        annotations:
+          alb.ingress.kubernetes.io/scheme: internet-facing
+    gateway:
+      servers:
       - port:
           number: 443
           name: https
@@ -37,18 +40,23 @@ istioGateway:
           credentialName: istio-certs
         hosts:
           - "*.diegoluisi.eti.br"
-    # private:
-    #   enabled: false
-    #   servers: []
-    #   - port:
-    #       number: 443
-    #       name: https
-    #       protocol: HTTPS
-    #     tls:
-    #       mode: SIMPLE
-    #       credentialName: ops-cert-secret
-    #     hosts:
-    #       - "*.diegoluisi.local"
+  private:
+    enabled: true
+    values:
+      service:
+        annotations:
+          alb.ingress.kubernetes.io/scheme: internal
+    gateway:
+      servers:
+      - port:
+          number: 443
+          name: https
+          protocol: HTTPS
+        tls:
+          mode: SIMPLE
+          credentialName: istio-certs
+        hosts:
+          - "*.diegoluisi.local"
 
 certManager:
   enabled: true
```

## 0.1.4 

**Release date:** 2022-08-02

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [resume] :building_construction: fix Technologies 
* [skip ci] :robot: Update Docs 
* Merge branch 'main' of github.com:devxp-tech/helm-charts 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index d93a2b6..7702c42 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -1,4 +1,4 @@
-# Default values for tooling.
+# Default values for cluster-bootstrap.
 # This is a YAML-formatted file.
 # Declare variables to be passed into your templates.
 
@@ -10,16 +10,50 @@ global:
     project: default
 
 sealedSecrets:
-  # -- default sealedSecrets
   enabled: true
-  # -- enabled sealedSecrets deployment
-  namespace: sealed-secrets
-  # -- default namespace to deploy sealed-secrets
+  namespace: kube-system
 
 istioBase:
   enabled: true
   namespace: istio-system
 
+istiod:
+  enabled: true
+  namespace: istio-system
+
+istioGateway:
+  enabled: true
+  namespace: istio-ingress
+  gateways:
+    public:
+      enabled: true
+      servers: []
+      - port:
+          number: 443
+          name: https
+          protocol: HTTPS
+        tls:
+          mode: SIMPLE
+          credentialName: istio-certs
+        hosts:
+          - "*.diegoluisi.eti.br"
+    # private:
+    #   enabled: false
+    #   servers: []
+    #   - port:
+    #       number: 443
+    #       name: https
+    #       protocol: HTTPS
+    #     tls:
+    #       mode: SIMPLE
+    #       credentialName: ops-cert-secret
+    #     hosts:
+    #       - "*.diegoluisi.local"
+
 certManager:
   enabled: true
   namespace: cert-manager
+
+prometheus:
+  enabled: true
+  namespace: monitoring
\ No newline at end of file
```

## 0.1.3 

**Release date:** 2022-07-28

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [gitops] :building_construction: bump 
* [skip ci] :robot: Update Docs 
* Merge branch 'main' of github.com:devxp-tech/helm-charts 

### Default value changes

```diff
# No changes in this release
```

## 0.1.2 

**Release date:** 2022-07-28

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [gitops] :building_construction: bump 
* [skip ci] :robot: Update Docs 
* [gitops] :building_construction: ajust folders 
* [gitops] :building_construction: ajust folders 

### Default value changes

```diff
# No changes in this release
```

## 0.1.1 

**Release date:** 2022-07-28

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [gitops] :building_construction: ajust folders 
* [gitops] :building_construction: ajust folders 

### Default value changes

```diff
diff --git a/charts/tooling/values.yaml b/charts/tooling/values.yaml
index 474b950..d93a2b6 100644
--- a/charts/tooling/values.yaml
+++ b/charts/tooling/values.yaml
@@ -10,8 +10,11 @@ global:
     project: default
 
 sealedSecrets:
+  # -- default sealedSecrets
   enabled: true
+  # -- enabled sealedSecrets deployment
   namespace: sealed-secrets
+  # -- default namespace to deploy sealed-secrets
 
 istioBase:
   enabled: true
```

## 0.1.0 

**Release date:** 2022-07-28

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [gitops] :building_construction: ajust folders 

### Default value changes

```diff
# Default values for tooling.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

global:
  application:
    cluster:
      name: "in-cluster"
      server: "https://kubernetes.default.svc"
    project: default

sealedSecrets:
  enabled: true
  namespace: sealed-secrets

istioBase:
  enabled: true
  namespace: istio-system

certManager:
  enabled: true
  namespace: cert-manager
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
