# Change Log

## Next Release 

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.34 

**Release date:** 2023-12-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.33 → 0.2.34 
* :goat: Fix Backstage (#120) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.33 

**Release date:** 2023-12-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.32 → 0.2.33 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.32 

**Release date:** 2023-12-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.31 → 0.2.32 
* 🛠️ Add quotes to image (#118) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.31 

**Release date:** 2023-12-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.30 → 0.2.31 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.30 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.29 → 0.2.30 
* :telescope: Add kube-prometheus-stack (#114) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 0a7f3cb..714319f 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -100,13 +100,14 @@ service:
   type: ClusterIP
   nodePort: {}
 
-
 # --istio Set default Istio
 istio:
   # enable istio-injection label on namespace
   enabled: true
-  # --istio.virtualServices Set default Istio
+  # --istio.virtualServices Set Istio virtualServices parameters
   virtualServices:
+    # --istio.virtualServices.enable Set Istio virtualServices enabled
+    enabled: true
     custom:
       hosts: []
   # --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
@@ -115,6 +116,8 @@ istio:
     enabled: true
     # --set peerAuthentication mode, values (UNSET, DISABLE, PERMISSIVE, STRICT)
     mode: PERMISSIVE
+  # --gateways set default gateway for virtual-service
+  gateways: istio-system/istio-ingressgateway
 
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 serviceAccount:
```

## 0.2.29 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.28 → 0.2.29 
* Hotfix/devxp app/peerauthentication (#113) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index fb426ed..0a7f3cb 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -13,11 +13,13 @@ global:
   # --commonLabels set common labels for all resources
   commonLabels: {}
   # team_name: dev
-  # enable istio-injection label on namespace
-  istio: true
   # --prometheus set prometheus server url
   prometheus:
     server: http://prometheus-prometheus.monitoring.svc.cluster.local:9090
+  # -- Network
+  network:
+    # --domain Set Default Domain
+    domain: devxp-tech.io
 
 # --namespace
 namespace:
@@ -83,7 +85,9 @@ consumers:
     #   command:
     #     - required
 
+# --service
 service:
+  # --service.port Define the Service Port
   port:
     name: tcp-node
     # --port is the port your application runs under
@@ -96,32 +100,32 @@ service:
   type: ClusterIP
   nodePort: {}
 
-# -- Network
-network:
-  # --domain Set Default Domain
-  domain: devxp-tech.io
-  # --gateways set default gateway for virtual-service
-  gateways: istio-system/istio-ingressgateway
 
-virtualServices:
-  custom:
-    hosts: []
+# --istio Set default Istio
+istio:
+  # enable istio-injection label on namespace
+  enabled: true
+  # --istio.virtualServices Set default Istio
+  virtualServices:
+    custom:
+      hosts: []
+  # --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
+  peerAuthentication:
+    # --enable peerAuthentication
+    enabled: true
+    # --set peerAuthentication mode, values (UNSET, DISABLE, PERMISSIVE, STRICT)
+    mode: PERMISSIVE
 
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 serviceAccount:
+  name: {}
   # --Specifies whether a service account should be created
   enabled: true
   # --Annotations to add to the service account
   annotations: {}
+  # --serviceAccount.annotations Automont Service Account Token
   automountServiceAccountToken: true
 
-# --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
-peerAuthentication:
-  # --enable peerAuthentication
-  enabled: true
-  # --set peerAuthentication mode, values (UNSET, DISABLE, PERMISSIVE, STRICT)
-  mode: PERMISSIVE
-
 # --replicaCount is used when autoscaling.enabled is false to set a manually number of pods
 replicaCount: 1
 # --autoscaling is the main object of autoscaling
@@ -149,6 +153,7 @@ autoscaling:
 container:
   # --port is the port your application runs under
   port: 8080
+  readOnlyRootFilesystem: true
 
   # --image is the object to specify the image to run in the deployment
 image:
@@ -175,7 +180,9 @@ resources:
     cpu: "100m"
     memory: "128Mi"
 
+# --probe
 probe:
+  # --probe.enabled Enable liveness and readiness probe
   enabled: true
 
 livenessProbe:
```

## 0.2.28 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.27 → 0.2.28 
* Hotfix/devxp app/peerauthentication (#112) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index aa74888..fb426ed 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -84,21 +84,22 @@ consumers:
     #     - required
 
 service:
+  port:
+    name: tcp-node
+    # --port is the port your application runs under
+    port: 80
   annotations: {}
   labels: {}
   externalDns:
     enabled: false
+  # --service An abstract way to expose an application running on a set of Pods as a network service.
+  type: ClusterIP
+  nodePort: {}
 
 # -- Network
 network:
   # --domain Set Default Domain
   domain: devxp-tech.io
-  # --service An abstract way to expose an application running on a set of Pods as a network service.
-  service:
-    type: ClusterIP
-    # --port is the port your application runs under
-    port: 80
-    nodePort: {}
   # --gateways set default gateway for virtual-service
   gateways: istio-system/istio-ingressgateway
 
@@ -261,5 +262,16 @@ quota:
 
 # --migration Set liquibase migration
 migration:
-  # -- enable liquibase migration
+  # -- migration.enable liquibase migration
   enabled: false
+
+# --serviceMonitor Prometheus Service Monitor
+serviceMonitor:
+  # --serviceMonitor.enabled Enable Prometheus Service Monitor
+  enabled: true
+  # --serviceMonitor.scheme Schema for Prometheus Service Monitor
+  scheme: http
+  # --serviceMonitor.path Path for Prometheus Service Monitor
+  path: /metrics
+  # --serviceMonitor.interval Path for Prometheus Service Monitor
+  interval: 60s
```

## 0.2.27 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.26 → 0.2.27 
* Hotfix/devxp app/peerauthentication (#111) 
* :robot: Update Docs 
* Hotfix/devxp app/name (#109) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index ca7ebdd..aa74888 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -17,7 +17,7 @@ global:
   istio: true
   # --prometheus set prometheus server url
   prometheus:
-    server: http://prometheus-server.monitoring
+    server: http://prometheus-prometheus.monitoring.svc.cluster.local:9090
 
 # --namespace
 namespace:
@@ -253,6 +253,7 @@ quota:
   # --resources Specifies the hard resources
   resources:
     hard:
+      # --requests.cpu Specifies the request cpu
       requests.cpu: "1"
       requests.memory: 1Gi
       limits.cpu: "2"
```

## 0.2.26 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.25 → 0.2.26 

### Default value changes

```diff
# No changes in this release
```

## 0.2.25 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.24 → 0.2.25 

### Default value changes

```diff
# No changes in this release
```

## 0.2.24 

**Release date:** 2023-11-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.23 → 0.2.24 
* Hotfix/devxp app/name (#106) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 7fafa2c..ca7ebdd 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -116,8 +116,10 @@ serviceAccount:
 
 # --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
 peerAuthentication:
-  # --enable PeerAuthentication
+  # --enable peerAuthentication
   enabled: true
+  # --set peerAuthentication mode, values (UNSET, DISABLE, PERMISSIVE, STRICT)
+  mode: PERMISSIVE
 
 # --replicaCount is used when autoscaling.enabled is false to set a manually number of pods
 replicaCount: 1
```

## 0.2.23 

**Release date:** 2023-10-30

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.22 → 0.2.23 
* :hammer: fix name (#105) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.22 

**Release date:** 2023-10-26

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.21 → 0.2.22 
* :star: Add SA parameters (#104) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index df94983..7fafa2c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -112,6 +112,7 @@ serviceAccount:
   enabled: true
   # --Annotations to add to the service account
   annotations: {}
+  automountServiceAccountToken: true
 
 # --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
 peerAuthentication:
```

## 0.2.21 

**Release date:** 2023-10-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.20 → 0.2.21 
* :hammer: fix sa missing (#97) 
* :robot: Update Docs 
* :sparkles: Add devxp-dev (#96) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.20 

**Release date:** 2023-07-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.19 → 0.2.20 
* :hammer: Update GitOps (#95) 
* Fix HPA (#94) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.19 

**Release date:** 2023-07-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.18 → 0.2.19 
* Hotfix/fix analysis2 (#93) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.18 

**Release date:** 2023-07-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.17 → 0.2.18 
* Hotfix/fix analysis2 (#92) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 79644a7..df94983 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -71,6 +71,7 @@ cronjobs:
     #   schecule: "* * * * *"
     #   command:
     #     - echo "ok"
+
 # --consumers is the object to configure an array of consumers
 consumers:
   # --terminationGracePeriodSeconds configures terminationGracePeriodSeconds
@@ -101,6 +102,10 @@ network:
   # --gateways set default gateway for virtual-service
   gateways: istio-system/istio-ingressgateway
 
+virtualServices:
+  custom:
+    hosts: []
+
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 serviceAccount:
   # --Specifies whether a service account should be created
```

## 0.2.17 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.16 → 0.2.17 
* :hammer: Add Api Notifications (#91) 
* :robot: Update Docs 
* Hotfix/fix analysis svc (#90) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 1bb2666..79644a7 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -37,7 +37,10 @@ argoRollouts:
   # --Specifies whether a resource quota should be created
   enabled: true
   revisionHistoryLimit: 5
-  analyses: true
+  analyses:
+    enabled: true
+    successCondition: 0.95
+    failureLimit: 3
   dynamicStableScale: true
   strategy:
     steps:
```

## 0.2.16 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.15 → 0.2.16 
* Hotfix/fix analysis svc (#88) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.15 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.14 → 0.2.15 
* :hammer: Add Api Notifications (#87) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.14 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.13 → 0.2.14 
* Hotfix/analysis (#85) 
* :hammer: Add Api Notifications 
* Hotfix/fix hpa (#84) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index f442dd3..1bb2666 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -37,8 +37,9 @@ argoRollouts:
   # --Specifies whether a resource quota should be created
   enabled: true
   revisionHistoryLimit: 5
+  analyses: true
+  dynamicStableScale: true
   strategy:
-    dynamicStableScale: true
     steps:
       - setWeight: 5
       - pause:
```

## 0.2.13 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.12 → 0.2.13 
* :hammer: Add Api Notifications (#83) 
* :robot: Update Docs 
* Hotfix/fix hpa (#82) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index e693331..f442dd3 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -13,6 +13,9 @@ global:
   # --commonLabels set common labels for all resources
   commonLabels: {}
   # team_name: dev
+  # enable istio-injection label on namespace
+  istio: true
+  # --prometheus set prometheus server url
   prometheus:
     server: http://prometheus-server.monitoring
 
@@ -20,8 +23,6 @@ global:
 namespace:
   enabled: true
   labels: {}
-  # enable istio-injection label on namespace
-  istio: true
   annotations: {}
   # sidecar.jaegertracing.io/inject: "true"
 
@@ -31,6 +32,7 @@ deployment:
   enabled: false
   annotations: {}
 
+# --argoRollouts enable Argo Rollouts Deployment
 argoRollouts:
   # --Specifies whether a resource quota should be created
   enabled: true
@@ -95,15 +97,6 @@ network:
   # --gateways set default gateway for virtual-service
   gateways: istio-system/istio-ingressgateway
 
-# --istioInjection enable istio injection
-# istioInjection:
-#   enabled: true
-
-# --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
-ingress:
-  # -- enable ingress
-  enabled: true
-
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 serviceAccount:
   # --Specifies whether a service account should be created
@@ -234,14 +227,18 @@ volumeMounts:
   #   mountPath: /sensitive-config/
   #   readOnly: true
 
+# --sealedSecrets enable creation of a secret to pull images
 sealedSecrets:
+  # --enabled create a Sealed Secret in the namespace
   enabled: true
+  # --encryptedData hash to create secret
   encryptedData: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
 
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 quota:
   # --Specifies whether a resource quota should be created
   enabled: true
+  # --resources Specifies the hard resources
   resources:
     hard:
       requests.cpu: "1"
@@ -249,6 +246,7 @@ quota:
       limits.cpu: "2"
       limits.memory: 2Gi
 
+# --migration Set liquibase migration
 migration:
   # -- enable liquibase migration
   enabled: false
```

## 0.2.12 

**Release date:** 2023-06-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.11 → 0.2.12 
* Hotfix/fix hpa (#81) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index af57c3d..e693331 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -13,6 +13,8 @@ global:
   # --commonLabels set common labels for all resources
   commonLabels: {}
   # team_name: dev
+  prometheus:
+    server: http://prometheus-server.monitoring
 
 # --namespace
 namespace:
@@ -29,6 +31,29 @@ deployment:
   enabled: false
   annotations: {}
 
+argoRollouts:
+  # --Specifies whether a resource quota should be created
+  enabled: true
+  revisionHistoryLimit: 5
+  strategy:
+    dynamicStableScale: true
+    steps:
+      - setWeight: 5
+      - pause:
+          duration: 10s
+      - setWeight: 20
+      - pause:
+          duration: 10s
+      - setWeight: 40
+      - pause:
+          duration: 10s
+      - setWeight: 60
+      - pause:
+          duration: 10s
+      - setWeight: 80
+      - pause:
+          duration: 10s
+
 # cronjobs list of cronjobs to be included in the application
 cronjobs:
   # --suspend used to disable all cronjobs in the list
@@ -213,30 +238,6 @@ sealedSecrets:
   enabled: true
   encryptedData: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
 
-# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
-argoRollouts:
-  # --Specifies whether a resource quota should be created
-  enabled: true
-  revisionHistoryLimit: 5
-  strategy:
-    dynamicStableScale: true
-    steps:
-      - setWeight: 5
-      - pause:
-          duration: 10s
-      - setWeight: 20
-      - pause:
-          duration: 10s
-      - setWeight: 40
-      - pause:
-          duration: 10s
-      - setWeight: 60
-      - pause:
-          duration: 10s
-      - setWeight: 80
-      - pause:
-          duration: 10s
-
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 quota:
   # --Specifies whether a resource quota should be created
```

## 0.2.11 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.10 → 0.2.11 
* Hotfix/fix hpa (#80) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 769a0c3..af57c3d 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -19,7 +19,7 @@ namespace:
   enabled: true
   labels: {}
   # enable istio-injection label on namespace
-  istio-injection: enabled
+  istio: true
   annotations: {}
   # sidecar.jaegertracing.io/inject: "true"
 
```

## 0.2.10 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.9 → 0.2.10 
* Hotfix/fix hpa (#79) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.9 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.8 → 0.2.9 
* Hotfix/fix hpa (#78) 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.2.8 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.7 → 0.2.8 
* :hammer: Add Api Notifications (#77) 
* Hotfix/pipeline bump7 (#76) 
* Hotfix/pipeline bump7 (#75) 
* Hotfix/pipeline bump6 (#71) 
* Hotfix/pipeline bump6 (#70) 
* :robot: Update Docs :zap: 
* Hotfix/pipeline bump6 (#68) 

### Default value changes

```diff
# No changes in this release
```

## 0.2.7 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.6 → 0.2.7 
* :hammer: Add Api Notifications (#67) 

### Default value changes

```diff
# No changes in this release
```

## 0.2.6 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.5 → 0.2.6 

### Default value changes

```diff
# No changes in this release
```

## 0.2.5 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #66 from devxp-tech/hotfix/pipeline-bump6 

### Default value changes

```diff
# No changes in this release
```

## 0.2.3 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.2.5 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.4 → 0.2.5 

### Default value changes

```diff
# No changes in this release
```

## 0.2.4 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #65 from devxp-tech/hotfix/pipeline-bump6 

### Default value changes

```diff
# No changes in this release
```

## 0.2.3 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.2.4 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.3 → 0.2.4 
* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.2.3 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.2 → 0.2.3 

### Default value changes

```diff
# No changes in this release
```

## 0.2.2 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #63 from devxp-tech/hotfix/pipeline-bump5 

### Default value changes

```diff
# No changes in this release
```

## 0.2.0 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.2.2 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.1 → 0.2.2 
* Merge branch 'main' into hotfix/pipeline-bump4 

### Default value changes

```diff
# No changes in this release
```

## 0.2.1 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.0 → 0.2.1 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.2.0 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 
* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.99 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #53 from devxp-tech/hotfix/pipeline-bump2 

### Default value changes

```diff
# No changes in this release
```

## 0.1.97 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.99 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.98 → 0.1.99 

### Default value changes

```diff
# No changes in this release
```

## 0.1.98 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #51 from devxp-tech/hotfix/pipeline-bump2 

### Default value changes

```diff
# No changes in this release
```

## 0.1.97 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.98 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.97 → 0.1.98 
* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.97 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.96 → 0.1.97 

### Default value changes

```diff
# No changes in this release
```

## 0.1.96 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #49 from devxp-tech/hotfix/pipeline-bump 

### Default value changes

```diff
# No changes in this release
```

## 0.1.95 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 
* [ci skip] :robot: [github actions actor] - Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.96 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #48 from devxp-tech/hotfix/pipeline-bump 

### Default value changes

```diff
# No changes in this release
```

## 0.1.95 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.96 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.95 → 0.1.96 
* Merge pull request #47 from devxp-tech/hotfix/pipeline-bump 
* :hammer: Add Api Notifications 
* [ci skip] :robot: [github actions actor] - Update Docs 
* :hammer: Add Api Notifications 

### Default value changes

```diff
# No changes in this release
```

## 0.1.95 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.94 → 0.1.95 
* Merge pull request #45 from devxp-tech/hotfix/fix-deploy-annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.94 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 
* Merge pull request #44 from devxp-tech/hotfix/fix-deploy-annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.95 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Add Api Notifications 
* [ci skip] :robot: [github actions actor] - Update Docs 
* :hammer: Add Api Notifications 
* [ci skip] :robot: [github actions actor] - Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index f355c7c..769a0c3 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -4,9 +4,8 @@
 
 # --name is the github repository name of this application deploy
 name: ""
-
-namespace:
-  enabled: true
+nameOverride: {}
+fullnameOverride: {}
 
 global:
   # --cluster Set Cluster Name
@@ -15,24 +14,48 @@ global:
   commonLabels: {}
   # team_name: dev
 
+# --namespace
+namespace:
+  enabled: true
+  labels: {}
+  # enable istio-injection label on namespace
+  istio-injection: enabled
+  annotations: {}
+  # sidecar.jaegertracing.io/inject: "true"
+
 # --deployment Disabled Deployment
 deployment:
   # --enabled default false
   enabled: false
+  annotations: {}
 
-# --nsLabels
-nsLabels:
-  # enable istio-injection label on namespace
-  istio-injection: enabled
-nsAnnotations:
-  {}
-  # sidecar.jaegertracing.io/inject: "true"
-podAnnotations: {}
+# cronjobs list of cronjobs to be included in the application
+cronjobs:
+  # --suspend used to disable all cronjobs in the list
+  suspend: false
+  # --list is an array of spec for create multiples cronjobs
+  list:
+    []
+    # - name: cron1
+    #   schecule: "* * * * *"
+    #   command:
+    #     - echo "ok"
+# --consumers is the object to configure an array of consumers
+consumers:
+  # --terminationGracePeriodSeconds configures terminationGracePeriodSeconds
+  terminationGracePeriodSeconds: 30
+  # --list is the array of consumer definition
+  list:
+    []
+    # - name: required
+    #   command:
+    #     - required
 
-serviceAnnotations: {}
-serviceLabels: {}
-externalDns:
-  enabled: false
+service:
+  annotations: {}
+  labels: {}
+  externalDns:
+    enabled: false
 
 # -- Network
 network:
@@ -57,7 +80,7 @@ ingress:
   enabled: true
 
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
-ServiceAccount:
+serviceAccount:
   # --Specifies whether a service account should be created
   enabled: true
   # --Annotations to add to the service account
@@ -142,12 +165,28 @@ nodeSelector: {}
 tolerations: []
 affinity: {}
 
-env:
+podAnnotations: {}
+# --A security context defines privilege and access control settings for a Pod or Container. About more: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
+podSecurityContext:
+  {}
+  # --fsGroup: 2000
+securityContext:
+  {}
+  # --capabilities:
+  # --drop:
+  # ---ALL
+  # --readOnlyRootFilesystem: true
+  # --runAsNonRoot: true
+  # --runAsUser: 1000
+
+envs:
   []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - name: ENVIROMENT
   #   value: dev
+  # - name: ENVIROMENT1
+  #   value: true
 
 envFrom:
   []
@@ -156,6 +195,20 @@ envFrom:
   # - configMapRef
   #     name: postgres-configs
 
+# --volumes specifies pod volumes
+volumes:
+  []
+  # - name: sensitive-config
+  #   secret:
+  #     secretName: app-secrets
+
+# --volumeMounts specifies where Kubernetes will mount Pod volumes
+volumeMounts:
+  []
+  # - name: sensitive-config
+  #   mountPath: /sensitive-config/
+  #   readOnly: true
+
 sealedSecrets:
   enabled: true
   encryptedData: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
```

## 0.1.94 

**Release date:** 2023-06-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #42 from devxp-tech/hotfix/fix-docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.91 

**Release date:** 2023-06-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: First Commit 
* [ci skip] :robot: [github actions actor] - Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index f55d0fc..f355c7c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -10,7 +10,7 @@ namespace:
 
 global:
   # --cluster Set Cluster Name
-  cluster: lgsk8sp1.grupologos.local
+  cluster: cluster.local
   # --commonLabels set common labels for all resources
   commonLabels: {}
   # team_name: dev
```

## 0.1.94 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #41 from devxp-tech/hotfix/fix-docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.91 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Fix Annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.94 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.93 → 0.1.94 

### Default value changes

```diff
# No changes in this release
```

## 0.1.93 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #40 from devxp-tech/hotfix/fix-docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.91 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Fix Annotations 
* [ci skip] :robot: [github actions actor] - Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.93 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #39 from devxp-tech/hotfix/fix-docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.91 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Fix Annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.93 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.92 → 0.1.93 

### Default value changes

```diff
# No changes in this release
```

## 0.1.92 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #38 from devxp-tech/hotfix/fix-docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.91 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Fix Annotations 
* [ci skip] :robot: [github actions actor] - Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.1.92 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.91 → 0.1.92 
* Merge pull request #35 from devxp-tech/hotfix/fix-docs 
* :zap: Fix Annotations 
* [ci skip] :robot: [github actions actor] - Update Docs 
* :zap: Fix Annotations 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index c5064ce..f55d0fc 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -22,6 +22,7 @@ deployment:
 
 # --nsLabels
 nsLabels:
+  # enable istio-injection label on namespace
   istio-injection: enabled
 nsAnnotations:
   {}
@@ -105,10 +106,13 @@ image:
   # --especify the tag of your image to deploy
   tag: "latest"
 
+# --imagePullSecrets secret used to download image on private container registry
 imagePullSecrets:
+  # --imagePullSecrets.enabled create secret do pull docker images in private registrys
   enabled: true
   name: ghcr-secret
 
+# --resources set deployment resources
 resources:
   requests:
     cpu: "50m"
```

## 0.1.91 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.90 → 0.1.91 

### Default value changes

```diff
# No changes in this release
```

## 0.1.90 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #33 from devxp-tech/hotfix/fix-annotaions 

### Default value changes

```diff
# No changes in this release
```

## 0.1.89 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Fix Annotations 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 2d0fc33..c5064ce 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -42,6 +42,8 @@ network:
     type: ClusterIP
     # --port is the port your application runs under
     port: 80
+    nodePort: {}
+  # --gateways set default gateway for virtual-service
   gateways: istio-system/istio-ingressgateway
 
 # --istioInjection enable istio injection
```

## 0.1.90 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.89 → 0.1.90 
* :zap: Fix Annotations 
* :zap: Fix Annotations 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 9a4b074..2d0fc33 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -3,15 +3,15 @@
 # Declare variables to be passed into your templates.
 
 # --name is the github repository name of this application deploy
-name: "teste"
+name: ""
 
 namespace:
   enabled: true
 
-# --cluster Set Cluster Name
-cluster: lgsk8sp1.grupologos.local
-
 global:
+  # --cluster Set Cluster Name
+  cluster: lgsk8sp1.grupologos.local
+  # --commonLabels set common labels for all resources
   commonLabels: {}
   # team_name: dev
 
```

## 0.1.89 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.88 → 0.1.89 

### Default value changes

```diff
# No changes in this release
```

## 0.1.88 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #31 from devxp-tech/hotfix/add-svc-annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.85 

**Release date:** 2023-06-05

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add NS Labels 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 2e5501c..9a4b074 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -3,13 +3,18 @@
 # Declare variables to be passed into your templates.
 
 # --name is the github repository name of this application deploy
-name: ""
+name: "teste"
 
 namespace:
   enabled: true
+
 # --cluster Set Cluster Name
 cluster: lgsk8sp1.grupologos.local
 
+global:
+  commonLabels: {}
+  # team_name: dev
+
 # --deployment Disabled Deployment
 deployment:
   # --enabled default false
@@ -18,9 +23,15 @@ deployment:
 # --nsLabels
 nsLabels:
   istio-injection: enabled
-nsAnnotations: {}
+nsAnnotations:
+  {}
+  # sidecar.jaegertracing.io/inject: "true"
 podAnnotations: {}
+
 serviceAnnotations: {}
+serviceLabels: {}
+externalDns:
+  enabled: false
 
 # -- Network
 network:
```

## 0.1.88 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.87 → 0.1.88 

### Default value changes

```diff
# No changes in this release
```

## 0.1.87 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #30 from devxp-tech/hotfix/add-svc-annotations 
* :zap: Add NS Labels 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 162ee02..2e5501c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -15,6 +15,13 @@ deployment:
   # --enabled default false
   enabled: false
 
+# --nsLabels
+nsLabels:
+  istio-injection: enabled
+nsAnnotations: {}
+podAnnotations: {}
+serviceAnnotations: {}
+
 # -- Network
 network:
   # --domain Set Default Domain
@@ -125,12 +132,6 @@ env:
   # - name: ENVIROMENT
   #   value: dev
 
-nsLabels:
-  istio-injection: enabled
-nsAnnotations: {}
-podAnnotations: {}
-serviceAnnotations: {}
-
 envFrom:
   []
   # examples:
```

## 0.1.85 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add Slack Notify 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 0c4c711..162ee02 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -27,8 +27,8 @@ network:
   gateways: istio-system/istio-ingressgateway
 
 # --istioInjection enable istio injection
-istioInjection:
-  enabled: true
+# istioInjection:
+#   enabled: true
 
 # --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
 ingress:
@@ -125,8 +125,9 @@ env:
   # - name: ENVIROMENT
   #   value: dev
 
-nsAnnotations:
+nsLabels:
   istio-injection: enabled
+nsAnnotations: {}
 podAnnotations: {}
 serviceAnnotations: {}
 
```

## 0.1.87 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.86 → 0.1.87 

### Default value changes

```diff
# No changes in this release
```

## 0.1.86 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #29 from devxp-tech/hotfix/add-svc-annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.85 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add Slack Notify 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index e5afac5..0c4c711 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -125,6 +125,8 @@ env:
   # - name: ENVIROMENT
   #   value: dev
 
+nsAnnotations:
+  istio-injection: enabled
 podAnnotations: {}
 serviceAnnotations: {}
 
```

## 0.1.86 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.85 → 0.1.86 
* :zap: Add Slack Notify 
* :zap: Add Slack Notify 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 70c7bfc..e5afac5 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -126,6 +126,7 @@ env:
   #   value: dev
 
 podAnnotations: {}
+serviceAnnotations: {}
 
 envFrom:
   []
```

## 0.1.85 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.84 → 0.1.85 
* Merge pull request #26 from devxp-tech/hotfix/add-annotations 
* :zap: Add Slack Notify 
* [skip ci] :robot: Update Docs :zap: 
* Merge pull request #24 from devxp-tech/hotfix/add-annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.1.84 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add Slack Notify 
* [skip ci] :robot: Update Docs :zap: 
* Merge pull request #23 from devxp-tech/hotfix/add-annotations 
* :zap: Add Slack Notify 

### Default value changes

```diff
# No changes in this release
```

## 0.1.83 

**Release date:** 2023-06-02

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add Slack Notify 
* [skip ci] :robot: Update Docs :zap: 
* :zap: Add Slack Notify 
* :zap: Add Slack Notify 
* Merge pull request #17 from devxp-tech/hotfix/chart-bump3 
* :zap: Add Chart Bump minor 
* [skip ci] :robot: Update Docs :zap: 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index ab32d90..70c7bfc 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -125,6 +125,8 @@ env:
   # - name: ENVIROMENT
   #   value: dev
 
+podAnnotations: {}
+
 envFrom:
   []
   # examples:
```

## 0.2.2 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.1 → 0.2.2 

### Default value changes

```diff
# No changes in this release
```

## 0.2.1 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Merge pull request #11 from devxp-tech/hotfix/force-deploy2 

### Default value changes

```diff
# No changes in this release
```

## 0.2.0 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add Chart Bump minor 

### Default value changes

```diff
# No changes in this release
```

## 0.2.1 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.2.0 → 0.2.1 
* Merge pull request #9 from devxp-tech/hotfix/force-deploy2 
* [skip ci] :robot: Update Docs :zap: 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 

### Default value changes

```diff
# No changes in this release
```

## 0.2.0 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-app chart version: 0.1.83 → 0.2.0 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump 
* :zap: Add Chart Bump 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.83 

**Release date:** 2023-05-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.83] :zap: add nodePort 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.82 

**Release date:** 2023-05-23

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.82] :hammer: add gateway 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 7abddae..ab32d90 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -24,6 +24,7 @@ network:
     type: ClusterIP
     # --port is the port your application runs under
     port: 80
+  gateways: istio-system/istio-ingressgateway
 
 # --istioInjection enable istio injection
 istioInjection:
```

## 0.1.81 

**Release date:** 2023-05-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.81] :zap: Update Sonarqube Url 
* [0.1.81] :zap: Update Sonarqube Url 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.80 

**Release date:** 2023-05-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.80] :zap: Update Sonarqube Url 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.79 

**Release date:** 2023-05-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: New tag 1.79 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 1eadd0c..7abddae 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -85,6 +85,7 @@ image:
   tag: "latest"
 
 imagePullSecrets:
+  enabled: true
   name: ghcr-secret
 
 resources:
```

## 0.1.78 

**Release date:** 2023-05-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: New tag 1.78 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.77 

**Release date:** 2023-05-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: New tag 1.77 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.76 

**Release date:** 2023-05-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: New tag 1.76 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 1670258..1eadd0c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -17,12 +17,12 @@ deployment:
 
 # -- Network
 network:
-# --domain Set Default Domain
-  domain: diegoluisi.eti.br
+  # --domain Set Default Domain
+  domain: devxp-tech.io
   # --service An abstract way to expose an application running on a set of Pods as a network service.
   service:
     type: ClusterIP
-  # --port is the port your application runs under
+    # --port is the port your application runs under
     port: 80
 
 # --istioInjection enable istio injection
@@ -46,19 +46,32 @@ peerAuthentication:
   # --enable PeerAuthentication
   enabled: true
 
+# --replicaCount is used when autoscaling.enabled is false to set a manually number of pods
+replicaCount: 1
 # --autoscaling is the main object of autoscaling
 autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
   enabled: true
   # --minReplicas is the number of mim pods to be running
-  minReplicas: 2
+  minReplicas: 1
   # --maxReplicas is the number of maximum scaling pods
-  maxReplicas: 4
-  # --targetCPUUtilizationPercentage is the percentage of CPU utilization do Scaling
-  targetCPUUtilizationPercentage: 70
+  maxReplicas: 2
+  # --targetCPUUtilizationPercentage is the percentage of cpu when reached to scale new pods
+  targetCPUUtilizationPercentage: 80
+  # --targetMemoryUtilizationPercentage is the percentage of memoty when reached to scale new pods
+  targetMemoryUtilizationPercentage: 80
+  # --customRules is a place to customize your application autoscaler using the original API available at: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
+  customRules:
+    []
+    # - type: Resource
+    #   resource:
+    #     name: memory
+    #     target:
+    #       type: Utilization
+    #       averageUtilization: 20
 
 container:
-# --port is the port your application runs under
+  # --port is the port your application runs under
   port: 8080
 
   # --image is the object to specify the image to run in the deployment
@@ -103,13 +116,15 @@ nodeSelector: {}
 tolerations: []
 affinity: {}
 
-env: []
+env:
+  []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - name: ENVIROMENT
   #   value: dev
 
-envFrom: []
+envFrom:
+  []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - configMapRef
@@ -156,4 +171,4 @@ quota:
 
 migration:
   # -- enable liquibase migration
-  enabled: false
\ No newline at end of file
+  enabled: false
```

## 0.1.75 

**Release date:** 2023-05-16

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: New tag 1.75 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.74 

**Release date:** 2023-03-28

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.74] :zap: Add link.argocd.argoproj.io/external-link 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 343edad..1670258 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -10,6 +10,11 @@ namespace:
 # --cluster Set Cluster Name
 cluster: lgsk8sp1.grupologos.local
 
+# --deployment Disabled Deployment
+deployment:
+  # --enabled default false
+  enabled: false
+
 # -- Network
 network:
 # --domain Set Default Domain
```

## 0.1.73 

**Release date:** 2023-03-28

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.73] :zap: Add link.argocd.argoproj.io/external-link 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.72 

**Release date:** 2023-03-10

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: 0.1.72 Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 1b06ead..343edad 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -5,6 +5,8 @@
 # --name is the github repository name of this application deploy
 name: ""
 
+namespace:
+  enabled: true
 # --cluster Set Cluster Name
 cluster: lgsk8sp1.grupologos.local
 
```

## 0.1.71 

**Release date:** 2023-03-10

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: 0.1.71 Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.70 

**Release date:** 2023-03-10

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: 0.1.69 Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.69 

**Release date:** 2023-03-10

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: 0.1.69 Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.68 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.68] :zap: Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.67 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.67] :zap: Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.66 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.66] :zap: Add Deployment 
* [0.1.66] :zap: Add Deployment 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.65 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.65] :zap: Add Deployment 
* [skip ci] :robot: Update Docs :zap: 
* [0.1.64] :zap: Add Deployment 

### Default value changes

```diff
# No changes in this release
```

## 0.1.64 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.64] :zap: Add Deployment 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 9dc908f..1b06ead 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -19,7 +19,8 @@ network:
     port: 80
 
 # --istioInjection enable istio injection
-istioInjection: enabled
+istioInjection:
+  enabled: true
 
 # --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
 ingress:
```

## 0.1.63 

**Release date:** 2023-03-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.63] :zap: Add Deployment 
* Update PR Template 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 72e7a89..9dc908f 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -34,7 +34,7 @@ ServiceAccount:
   annotations: {}
 
 # --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
-PeerAuthentication:
+peerAuthentication:
   # --enable PeerAuthentication
   enabled: true
 
@@ -136,7 +136,7 @@ argoRollouts:
           duration: 10s
 
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
-ResourceQuota:
+quota:
   # --Specifies whether a resource quota should be created
   enabled: true
   resources:
```

## 0.1.62 

**Release date:** 2023-02-18

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.62] :up: Add Synk Workflow 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 85e71bf..72e7a89 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -14,6 +14,7 @@ network:
   domain: diegoluisi.eti.br
   # --service An abstract way to expose an application running on a set of Pods as a network service.
   service:
+    type: ClusterIP
   # --port is the port your application runs under
     port: 80
 
```

## 0.1.61 

**Release date:** 2023-02-18

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.61] :up: Add Synk Workflow 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index f654e9c..85e71bf 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -8,56 +8,22 @@ name: ""
 # --cluster Set Cluster Name
 cluster: lgsk8sp1.grupologos.local
 
+# -- Network
+network:
 # --domain Set Default Domain
-domain: diegoluisi.eti.br
+  domain: diegoluisi.eti.br
+  # --service An abstract way to expose an application running on a set of Pods as a network service.
+  service:
+  # --port is the port your application runs under
+    port: 80
 
+# --istioInjection enable istio injection
 istioInjection: enabled
 
-container:
-# --port is the port your application runs under
-  port: 8080
-
-# --service An abstract way to expose an application running on a set of Pods as a network service.
-service:
-# --port is the port your application runs under
-  port: 80
-
-
-
-# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
-argoRollouts:
-  # --Specifies whether a resource quota should be created
-  enabled: true
-  revisionHistoryLimit: 5
-  strategy:
-    dynamicStableScale: true
-    steps:
-      - setWeight: 5
-      - pause:
-          duration: 10s
-      - setWeight: 20
-      - pause:
-          duration: 10s
-      - setWeight: 40
-      - pause:
-          duration: 10s
-      - setWeight: 60
-      - pause:
-          duration: 10s
-      - setWeight: 80
-      - pause:
-          duration: 10s
-
-# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
-ResourceQuota:
-  # --Specifies whether a resource quota should be created
+# --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
+ingress:
+  # -- enable ingress
   enabled: true
-  resources:
-    hard:
-      requests.cpu: "1"
-      requests.memory: 1Gi
-      limits.cpu: "2"
-      limits.memory: 2Gi
 
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 ServiceAccount:
@@ -71,15 +37,6 @@ PeerAuthentication:
   # --enable PeerAuthentication
   enabled: true
 
-# --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
-ingress:
-  # -- enable ingress
-  enabled: true
-
-migration:
-  # -- enable liquibase migration
-  enabled: false
-
 # --autoscaling is the main object of autoscaling
 autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
@@ -91,6 +48,10 @@ autoscaling:
   # --targetCPUUtilizationPercentage is the percentage of CPU utilization do Scaling
   targetCPUUtilizationPercentage: 70
 
+container:
+# --port is the port your application runs under
+  port: 8080
+
   # --image is the object to specify the image to run in the deployment
 image:
   # --repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME
@@ -149,3 +110,41 @@ sealedSecrets:
   enabled: true
   encryptedData: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
 
+# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
+argoRollouts:
+  # --Specifies whether a resource quota should be created
+  enabled: true
+  revisionHistoryLimit: 5
+  strategy:
+    dynamicStableScale: true
+    steps:
+      - setWeight: 5
+      - pause:
+          duration: 10s
+      - setWeight: 20
+      - pause:
+          duration: 10s
+      - setWeight: 40
+      - pause:
+          duration: 10s
+      - setWeight: 60
+      - pause:
+          duration: 10s
+      - setWeight: 80
+      - pause:
+          duration: 10s
+
+# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
+ResourceQuota:
+  # --Specifies whether a resource quota should be created
+  enabled: true
+  resources:
+    hard:
+      requests.cpu: "1"
+      requests.memory: 1Gi
+      limits.cpu: "2"
+      limits.memory: 2Gi
+
+migration:
+  # -- enable liquibase migration
+  enabled: false
\ No newline at end of file
```

## 0.1.60 

**Release date:** 2023-02-18

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.60] :up: Add Synk Workflow 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.59 

**Release date:** 2023-02-06

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.59] :zap: Update SVC externalTrafficPolicy 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.58 

**Release date:** 2023-01-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [Trivy] :lock: Fix Dependecys 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.57 

**Release date:** 2023-01-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.57] :zap: Test Pipeline Liquibase 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.56 

**Release date:** 2023-01-26

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.56] :zap: Add Commands 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.55 

**Release date:** 2023-01-26

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.55] :zap: Add Commands 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 39a665e..f654e9c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -11,8 +11,7 @@ cluster: lgsk8sp1.grupologos.local
 # --domain Set Default Domain
 domain: diegoluisi.eti.br
 
-istioInjection:
-  enabled: true
+istioInjection: enabled
 
 container:
 # --port is the port your application runs under
```

## 0.1.54 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.53] :zap: Add Commands 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.53 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.53] :zap: Add Commands 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.52 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.52] :zap: Add Commands 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.51 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.51] :zap: Update Argo Rollouts 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.50 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.50] :zap: Update Argo Rollouts 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.49 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.49] :zap: Update Argo Rollouts 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 31bce29..39a665e 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -11,6 +11,9 @@ cluster: lgsk8sp1.grupologos.local
 # --domain Set Default Domain
 domain: diegoluisi.eti.br
 
+istioInjection:
+  enabled: true
+
 container:
 # --port is the port your application runs under
   port: 8080
@@ -21,6 +24,7 @@ service:
   port: 80
 
 
+
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 argoRollouts:
   # --Specifies whether a resource quota should be created
```

## 0.1.48 

**Release date:** 2023-01-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [0.1.48] :zap: Update Argo Rollouts 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 7658c87..31bce29 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -22,9 +22,28 @@ service:
 
 
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
-rollout:
+argoRollouts:
   # --Specifies whether a resource quota should be created
   enabled: true
+  revisionHistoryLimit: 5
+  strategy:
+    dynamicStableScale: true
+    steps:
+      - setWeight: 5
+      - pause:
+          duration: 10s
+      - setWeight: 20
+      - pause:
+          duration: 10s
+      - setWeight: 40
+      - pause:
+          duration: 10s
+      - setWeight: 60
+      - pause:
+          duration: 10s
+      - setWeight: 80
+      - pause:
+          duration: 10s
 
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 ResourceQuota:
```

## 0.1.47 

**Release date:** 2023-01-19

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [feature/liquibase] :zap: remove istio injection from job 2 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.46 

**Release date:** 2023-01-19

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [feature/liquibase] :zap: remove istio injection from job 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.45 

**Release date:** 2023-01-19

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [feature/liquibase] :zap: Update ttlSecondsAfterFinished 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.44 

**Release date:** 2023-01-19

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [feature/liquibase] :zap: Update ttlSecondsAfterFinished 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.43 

**Release date:** 2023-01-17

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [feature/liquibase] :zap: Update ttlSecondsAfterFinished 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index dc69297..7658c87 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -54,6 +54,10 @@ ingress:
   # -- enable ingress
   enabled: true
 
+migration:
+  # -- enable liquibase migration
+  enabled: false
+
 # --autoscaling is the main object of autoscaling
 autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
```

## 0.1.42 

**Release date:** 2022-12-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: remove ns.svc 

### Default value changes

```diff
# No changes in this release
```

## 0.1.41 

**Release date:** 2022-12-27

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [ci skip] :zap: remove ns.svc 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.40 

**Release date:** 2022-12-23

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [quota] :zap: Update to 0.1.40 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 6b22244..dc69297 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -30,11 +30,12 @@ rollout:
 ResourceQuota:
   # --Specifies whether a resource quota should be created
   enabled: true
-  hard:
-    requests.cpu: "1"
-    requests.memory: 1Gi
-    limits.cpu: "2"
-    limits.memory: 2Gi
+  resources:
+    hard:
+      requests.cpu: "1"
+      requests.memory: 1Gi
+      limits.cpu: "2"
+      limits.memory: 2Gi
 
 # --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 ServiceAccount:
@@ -118,5 +119,7 @@ envFrom: []
   # - configMapRef
   #     name: postgres-configs
 
-sealedSecrets: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
+sealedSecrets:
+  enabled: true
+  encryptedData: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
 
```

## 0.1.39 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.38 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 81686a5..6b22244 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -118,5 +118,5 @@ envFrom: []
   # - configMapRef
   #     name: postgres-configs
 
-sealedSecrets: AgAgpPI8HoEvSU2MOe9ghHr48GgAFkvIKhTTyhWLJj3QFmv/vKHgiRD7GPuZHt88KZv/TOkmmigFaIkgEbzb4nNyyewd1ILB1Bh1sGbEYjSJ0p6I8LHwFAp+BcN3ZkAO1B8XqHuk7SfeubfAcjaezcTcwEOR4BQuZnHykSbqWoJS41FTj7JbWw06HmAX8fQzSQzz815oJN2f3AlfRuRWtgIQhXBpEzTOoxvWq95rgW0cey2ois4kHHQGED0UuafVHnDJfSnqz5g+O21h4MLsYOD0GJcxjXUQTUmeRiE316nzsJJkOKpzbgg6TJfzwAPRxSs6IT7zXp9epiky30Da89PtzlK4ctJsM/zAuJ1i+3EgrR/aUe9xFGWz+LSUAPrHM7O64thk16EkS7zRiMSujmfKJoXz/jTcFER52f/V2ssxIE6gUKs6/9gAYNfLb0FTq9fuNNl9Rc4z+o+O/3DEkp+4Aptt5eR1bKBvrT3Ecdkh3KvMBNaQJLeK3nFp080bfYX+TodarP/omRoFtggPAI0+HfK3GpsOFAtRjuz7yv5kcQvfu5SQz6Wur2RXo7IdVVCvuDCaHtFjzT+h2Ia/2+aQMdz5BcqoUvJ6yaYNjLnVN8jotNd2zD8ZfLxwqfixT9Xeh+UTB3fo417u6BTEdYlbOXqEtUGWQdYRfEXjZ7YS/tW7A5YIiNP5v/AoU04z5Znvmt4D7idI7su2q1gu911HjKUVymiYWOBvrRJNgtGqzX2vUKBazaVC/50s36lRsA1DsKgmFp6CBfoCzlcRx77XQG3Td0+QNt7M9y8ZQkrb6sAEk79PJ1IFGnFqjvfQDYnXglTl/w==
+sealedSecrets: AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg==
 
```

## 0.1.38 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.38 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 5c002dd..81686a5 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -118,5 +118,5 @@ envFrom: []
   # - configMapRef
   #     name: postgres-configs
 
-sealedSecrets: AgC/rR4wh04d2uNrvV78W9Gx1Gpt92jY3QtdVjV2Vl3mdk5T/IvuU6zFbsE06KNzyfBgczUyOPWSnJKDo8h88NHf02CvZLanjBsI5YbuvyIM5/Vjq5QYAb6iiAamRajAreqTqzY/b8oIAqDfK53hbQy0PteF5Xj/TVJ4bkiKROBoBPTVFPH4Af4QMVzfmyeuSSfyDd7FWNn4cahBPXjCA57fxeCQnboMfpUdpOoaNtHF3aPwlAYvZpPFZ2kVx52T1v659DWWhBINqPtoy7fgSeYWLsvZSrHBx8+EQcAuZ01Z2jfxMig2PEW/anG+wB203sJOlMk2Ot6VN3TiOodR1PrIypFzYmg7l4kRU+AjctTZc8RwEb/Jgfa/sE7G0GhUTDqrNB8etX7sYFCiX9W/L75TNlS0z+bzfYpe61fFX2yYO6mbO39bNTetRE2OaQNMGOTSzJVrZ1EolN8UJzmLAgkbezuPoTs+V1DaIVzP2vVdOXtR6ifrbFiyPpH953+SMK19fP2i8p8ledHXAsvOep/zTWMatSJ4wmrs9CiggMvpQ1GdNwVP6mHnsUVKolFMtWLhPQR4J1waRMgQflj7Mt2ZF9CMCYf56pGWv9fQZoqDJvm6XN2Cb+TLY0ukCJWU++c7U6xtsbx8v/DtY9G3EjiTCWb/ex6EgXAqB9HVgVaYmMmlCSCBbZNF8btFoRLv5RCAdoV6HWe+EL0W4EGNySJYuVJ/771tYx0l48jshVmrcMJzt1JjYI/3+Jnpuoi6rYnjYclp0rjlz+TUOO1UCbGIPAoZcxBRZ0InTBtgmAqZX6ozzwCfansbxmDlgKbSHcrvw3e45A==
+sealedSecrets: AgAgpPI8HoEvSU2MOe9ghHr48GgAFkvIKhTTyhWLJj3QFmv/vKHgiRD7GPuZHt88KZv/TOkmmigFaIkgEbzb4nNyyewd1ILB1Bh1sGbEYjSJ0p6I8LHwFAp+BcN3ZkAO1B8XqHuk7SfeubfAcjaezcTcwEOR4BQuZnHykSbqWoJS41FTj7JbWw06HmAX8fQzSQzz815oJN2f3AlfRuRWtgIQhXBpEzTOoxvWq95rgW0cey2ois4kHHQGED0UuafVHnDJfSnqz5g+O21h4MLsYOD0GJcxjXUQTUmeRiE316nzsJJkOKpzbgg6TJfzwAPRxSs6IT7zXp9epiky30Da89PtzlK4ctJsM/zAuJ1i+3EgrR/aUe9xFGWz+LSUAPrHM7O64thk16EkS7zRiMSujmfKJoXz/jTcFER52f/V2ssxIE6gUKs6/9gAYNfLb0FTq9fuNNl9Rc4z+o+O/3DEkp+4Aptt5eR1bKBvrT3Ecdkh3KvMBNaQJLeK3nFp080bfYX+TodarP/omRoFtggPAI0+HfK3GpsOFAtRjuz7yv5kcQvfu5SQz6Wur2RXo7IdVVCvuDCaHtFjzT+h2Ia/2+aQMdz5BcqoUvJ6yaYNjLnVN8jotNd2zD8ZfLxwqfixT9Xeh+UTB3fo417u6BTEdYlbOXqEtUGWQdYRfEXjZ7YS/tW7A5YIiNP5v/AoU04z5Znvmt4D7idI7su2q1gu911HjKUVymiYWOBvrRJNgtGqzX2vUKBazaVC/50s36lRsA1DsKgmFp6CBfoCzlcRx77XQG3Td0+QNt7M9y8ZQkrb6sAEk79PJ1IFGnFqjvfQDYnXglTl/w==
 
```

## 0.1.37 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.37 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 8c16cc0..5c002dd 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -118,3 +118,5 @@ envFrom: []
   # - configMapRef
   #     name: postgres-configs
 
+sealedSecrets: AgC/rR4wh04d2uNrvV78W9Gx1Gpt92jY3QtdVjV2Vl3mdk5T/IvuU6zFbsE06KNzyfBgczUyOPWSnJKDo8h88NHf02CvZLanjBsI5YbuvyIM5/Vjq5QYAb6iiAamRajAreqTqzY/b8oIAqDfK53hbQy0PteF5Xj/TVJ4bkiKROBoBPTVFPH4Af4QMVzfmyeuSSfyDd7FWNn4cahBPXjCA57fxeCQnboMfpUdpOoaNtHF3aPwlAYvZpPFZ2kVx52T1v659DWWhBINqPtoy7fgSeYWLsvZSrHBx8+EQcAuZ01Z2jfxMig2PEW/anG+wB203sJOlMk2Ot6VN3TiOodR1PrIypFzYmg7l4kRU+AjctTZc8RwEb/Jgfa/sE7G0GhUTDqrNB8etX7sYFCiX9W/L75TNlS0z+bzfYpe61fFX2yYO6mbO39bNTetRE2OaQNMGOTSzJVrZ1EolN8UJzmLAgkbezuPoTs+V1DaIVzP2vVdOXtR6ifrbFiyPpH953+SMK19fP2i8p8ledHXAsvOep/zTWMatSJ4wmrs9CiggMvpQ1GdNwVP6mHnsUVKolFMtWLhPQR4J1waRMgQflj7Mt2ZF9CMCYf56pGWv9fQZoqDJvm6XN2Cb+TLY0ukCJWU++c7U6xtsbx8v/DtY9G3EjiTCWb/ex6EgXAqB9HVgVaYmMmlCSCBbZNF8btFoRLv5RCAdoV6HWe+EL0W4EGNySJYuVJ/771tYx0l48jshVmrcMJzt1JjYI/3+Jnpuoi6rYnjYclp0rjlz+TUOO1UCbGIPAoZcxBRZ0InTBtgmAqZX6ozzwCfansbxmDlgKbSHcrvw3e45A==
+
```

## 0.1.36 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.36 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.35 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.35 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.34 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.34 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index aa19788..8c16cc0 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -11,7 +11,7 @@ cluster: lgsk8sp1.grupologos.local
 # --domain Set Default Domain
 domain: diegoluisi.eti.br
 
-application:
+container:
 # --port is the port your application runs under
   port: 8080
 
```

## 0.1.33 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.32 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.32 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [teste-ghrc] :zap: Update Chart 0.1.32 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.31 

**Release date:** 2022-12-22

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :zap: Add imagePullSecrets 0.1.31 
* [skip ci] :robot: Update Docs :zap: 
* :zap: Update Pipeline 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 16b3878..aa19788 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -5,27 +5,52 @@
 # --name is the github repository name of this application deploy
 name: ""
 
+# --cluster Set Cluster Name
+cluster: lgsk8sp1.grupologos.local
+
+# --domain Set Default Domain
+domain: diegoluisi.eti.br
+
+application:
+# --port is the port your application runs under
+  port: 8080
+
+# --service An abstract way to expose an application running on a set of Pods as a network service.
 service:
-  port: 80
 # --port is the port your application runs under
-port: 8080
+  port: 80
+
+
+# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
+rollout:
+  # --Specifies whether a resource quota should be created
+  enabled: true
 
 # --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 ResourceQuota:
   # --Specifies whether a resource quota should be created
   enabled: true
+  hard:
+    requests.cpu: "1"
+    requests.memory: 1Gi
+    limits.cpu: "2"
+    limits.memory: 2Gi
 
-# -- A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
+# --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
 ServiceAccount:
   # --Specifies whether a service account should be created
   enabled: true
   # --Annotations to add to the service account
   annotations: {}
 
+# --PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar.
 PeerAuthentication:
+  # --enable PeerAuthentication
   enabled: true
 
+# --ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
 ingress:
+  # -- enable ingress
   enabled: true
 
 # --autoscaling is the main object of autoscaling
@@ -49,6 +74,8 @@ image:
   # --especify the tag of your image to deploy
   tag: "latest"
 
+imagePullSecrets:
+  name: ghcr-secret
 
 resources:
   requests:
```

## 0.1.30 

**Release date:** 2022-12-17

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix service :rocket: 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.29 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :up: add 0.1.29 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.28 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :up: add 0.1.27 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index aed5126..16b3878 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -5,6 +5,8 @@
 # --name is the github repository name of this application deploy
 name: ""
 
+service:
+  port: 80
 # --port is the port your application runs under
 port: 8080
 
```

## 0.1.27 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :up: add 0.1.27 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 96b6b1b..aed5126 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -56,6 +56,23 @@ resources:
     cpu: "100m"
     memory: "128Mi"
 
+probe:
+  enabled: true
+
+livenessProbe:
+  httpGet:
+    path: /health-check/liveness
+    port: 8080
+  initialDelaySeconds: 15
+  periodSeconds: 10
+
+readinessProbe:
+  httpGet:
+    path: /health-check/readiness
+    port: 8080
+  initialDelaySeconds: 15
+  periodSeconds: 10
+
 nodeSelector: {}
 tolerations: []
 affinity: {}
@@ -70,4 +87,5 @@ envFrom: []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - configMapRef
-  #     name: postgres-configs
\ No newline at end of file
+  #     name: postgres-configs
+
```

## 0.1.26 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.26 
* [devxp-app] :rocket: Add env and envFrom 0.1.25 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.25 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.25 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 4cd6d3d..96b6b1b 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -70,7 +70,4 @@ envFrom: []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - configMapRef
-  #     name: postgres-configs
-
-readinessProbe: []
-livenessProbe: []
\ No newline at end of file
+  #     name: postgres-configs
\ No newline at end of file
```

## 0.1.24 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.24 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.23 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.23 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 96b6b1b..4cd6d3d 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -70,4 +70,7 @@ envFrom: []
   # examples:
   # please note that when the value is a number, you must quote the value to cast to string!
   # - configMapRef
-  #     name: postgres-configs
\ No newline at end of file
+  #     name: postgres-configs
+
+readinessProbe: []
+livenessProbe: []
\ No newline at end of file
```

## 0.1.22 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.22 
* [devxp-app] :rocket: Add env and envFrom 0.1.21 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.20 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] :rocket: Add env and envFrom 0.1.20 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.19 

**Release date:** 2022-12-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-app] add env and envfrom 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index ac72a4d..96b6b1b 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -54,4 +54,20 @@ resources:
     memory: "64Mi"
   limits:
     cpu: "100m"
-    memory: "128Mi"
\ No newline at end of file
+    memory: "128Mi"
+
+nodeSelector: {}
+tolerations: []
+affinity: {}
+
+env: []
+  # examples:
+  # please note that when the value is a number, you must quote the value to cast to string!
+  # - name: ENVIROMENT
+  #   value: dev
+
+envFrom: []
+  # examples:
+  # please note that when the value is a number, you must quote the value to cast to string!
+  # - configMapRef
+  #     name: postgres-configs
\ No newline at end of file
```

## 0.1.18 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.18 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.17 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.17 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index c6ba4b9..ac72a4d 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -31,9 +31,9 @@ autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
   enabled: true
   # --minReplicas is the number of mim pods to be running
-  minReplicas: 1
+  minReplicas: 2
   # --maxReplicas is the number of maximum scaling pods
-  maxReplicas: 2
+  maxReplicas: 4
   # --targetCPUUtilizationPercentage is the percentage of CPU utilization do Scaling
   targetCPUUtilizationPercentage: 70
 
```

## 0.1.16 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.16 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.15 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.13 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.14 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.13 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 45e3342..c6ba4b9 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -34,6 +34,8 @@ autoscaling:
   minReplicas: 1
   # --maxReplicas is the number of maximum scaling pods
   maxReplicas: 2
+  # --targetCPUUtilizationPercentage is the percentage of CPU utilization do Scaling
+  targetCPUUtilizationPercentage: 70
 
   # --image is the object to specify the image to run in the deployment
 image:
```

## 0.1.13 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.13 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.12 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.11 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.11 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.10 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.10 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.9 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.9 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.8 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.8 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.7 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.7 

### Default value changes

```diff
# No changes in this release
```

## 0.1.6 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.6 
* [skip ci] :robot: Update Docs :zap: 
* [new-app] :rocket: Add devxp-app 0.1.6 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index ac9cb91..45e3342 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -20,6 +20,12 @@ ServiceAccount:
   # --Annotations to add to the service account
   annotations: {}
 
+PeerAuthentication:
+  enabled: true
+
+ingress:
+  enabled: true
+
 # --autoscaling is the main object of autoscaling
 autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
@@ -27,7 +33,7 @@ autoscaling:
   # --minReplicas is the number of mim pods to be running
   minReplicas: 1
   # --maxReplicas is the number of maximum scaling pods
-  maxReplicas: 5
+  maxReplicas: 2
 
   # --image is the object to specify the image to run in the deployment
 image:
@@ -38,5 +44,12 @@ image:
   pullPolicy: IfNotPresent
   # --especify the tag of your image to deploy
   tag: "latest"
-  
-imagePullSecrets: []
\ No newline at end of file
+
+
+resources:
+  requests:
+    cpu: "50m"
+    memory: "64Mi"
+  limits:
+    cpu: "100m"
+    memory: "128Mi"
\ No newline at end of file
```

## 0.1.5 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 
* [new-app] :rocket: Add devxp-app 0.1.1 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 488128c..ac9cb91 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -38,4 +38,5 @@ image:
   pullPolicy: IfNotPresent
   # --especify the tag of your image to deploy
   tag: "latest"
+  
 imagePullSecrets: []
\ No newline at end of file
```

## 0.1.4 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 
* [skip ci] :robot: Update Docs :zap: 
* [new-app] :rocket: Add devxp-app 0.1.1 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index 5c23e1a..488128c 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -8,10 +8,18 @@ name: ""
 # --port is the port your application runs under
 port: 8080
 
-# Enable ResourceQuota default: true
+# --ResourceQuota provides constraints that limit aggregate resource consumption per namespace
 ResourceQuota:
+  # --Specifies whether a resource quota should be created
   enabled: true
 
+# -- A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
+ServiceAccount:
+  # --Specifies whether a service account should be created
+  enabled: true
+  # --Annotations to add to the service account
+  annotations: {}
+
 # --autoscaling is the main object of autoscaling
 autoscaling:
   # --enabled is the flag to sinalize this funcionality is enabled
@@ -19,4 +27,15 @@ autoscaling:
   # --minReplicas is the number of mim pods to be running
   minReplicas: 1
   # --maxReplicas is the number of maximum scaling pods
-  maxReplicas: 5
\ No newline at end of file
+  maxReplicas: 5
+
+  # --image is the object to specify the image to run in the deployment
+image:
+  # --repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME
+  # if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag
+  repository: ""
+  # --pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways
+  pullPolicy: IfNotPresent
+  # --especify the tag of your image to deploy
+  tag: "latest"
+imagePullSecrets: []
\ No newline at end of file
```

## 0.1.3 

**Release date:** 2022-12-13

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-app/values.yaml b/charts/devxp-app/values.yaml
index f6672ed..5c23e1a 100644
--- a/charts/devxp-app/values.yaml
+++ b/charts/devxp-app/values.yaml
@@ -2,81 +2,21 @@
 # This is a YAML-formatted file.
 # Declare variables to be passed into your templates.
 
-replicaCount: 1
+# --name is the github repository name of this application deploy
+name: ""
 
-image:
-  repository: nginx
-  pullPolicy: IfNotPresent
-  # Overrides the image tag whose default is the chart appVersion.
-  tag: ""
+# --port is the port your application runs under
+port: 8080
 
-imagePullSecrets: []
-nameOverride: ""
-fullnameOverride: ""
-
-serviceAccount:
-  # Specifies whether a service account should be created
-  create: true
-  # Annotations to add to the service account
-  annotations: {}
-  # The name of the service account to use.
-  # If not set and create is true, a name is generated using the fullname template
-  name: ""
-
-podAnnotations: {}
-
-podSecurityContext: {}
-  # fsGroup: 2000
-
-securityContext: {}
-  # capabilities:
-  #   drop:
-  #   - ALL
-  # readOnlyRootFilesystem: true
-  # runAsNonRoot: true
-  # runAsUser: 1000
-
-service:
-  type: ClusterIP
-  port: 80
-
-ingress:
-  enabled: false
-  className: ""
-  annotations: {}
-    # kubernetes.io/ingress.class: nginx
-    # kubernetes.io/tls-acme: "true"
-  hosts:
-    - host: chart-example.local
-      paths:
-        - path: /
-          pathType: ImplementationSpecific
-  tls: []
-  #  - secretName: chart-example-tls
-  #    hosts:
-  #      - chart-example.local
-
-resources: {}
-  # We usually recommend not to specify default resources and to leave this as a conscious
-  # choice for the user. This also increases chances charts run on environments with little
-  # resources, such as Minikube. If you do want to specify resources, uncomment the following
-  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
-  # limits:
-  #   cpu: 100m
-  #   memory: 128Mi
-  # requests:
-  #   cpu: 100m
-  #   memory: 128Mi
+# Enable ResourceQuota default: true
+ResourceQuota:
+  enabled: true
 
+# --autoscaling is the main object of autoscaling
 autoscaling:
-  enabled: false
+  # --enabled is the flag to sinalize this funcionality is enabled
+  enabled: true
+  # --minReplicas is the number of mim pods to be running
   minReplicas: 1
-  maxReplicas: 100
-  targetCPUUtilizationPercentage: 80
-  # targetMemoryUtilizationPercentage: 80
-
-nodeSelector: {}
-
-tolerations: []
-
-affinity: {}
+  # --maxReplicas is the number of maximum scaling pods
+  maxReplicas: 5
\ No newline at end of file
```

## 0.1.2 

**Release date:** 2022-12-13

![AppVersion: 1.1.0](https://img.shields.io/static/v1?label=AppVersion&message=1.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 

### Default value changes

```diff
# No changes in this release
```

## 0.1.1 

**Release date:** 2022-12-13

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 0.1.1 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.1.0 

**Release date:** 2022-12-13

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [new-app] :rocket: Add devxp-app 

### Default value changes

```diff
# Default values for devxp-app.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: ""

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}

podSecurityContext: {}
  # fsGroup: 2000

securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  className: ""
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources: {}
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  # limits:
  #   cpu: 100m
  #   memory: 128Mi
  # requests:
  #   cpu: 100m
  #   memory: 128Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
