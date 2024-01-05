# Change Log

## Next Release 

![AppVersion: 0.0.1](https://img.shields.io/static/v1?label=AppVersion&message=0.0.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :robot: Update Docs 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.0.3 

**Release date:** 2023-10-25

![AppVersion: 0.0.1](https://img.shields.io/static/v1?label=AppVersion&message=0.0.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: Fix Repository (#103) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-dev/values.yaml b/charts/devxp-dev/values.yaml
index 851f37a..f711561 100644
--- a/charts/devxp-dev/values.yaml
+++ b/charts/devxp-dev/values.yaml
@@ -5,8 +5,9 @@
 # --name is the github repository name of this application deploy
 name: ""
 
-# deployment:
-#   enabled: true
+deployment:
+  enabled: true
+  annotations: {}
 
 resources:
   requests:
@@ -24,7 +25,7 @@ container:
 image:
   # --repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME
   # if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag
-  repository: ""
+  repository: "ghcr.io/devxp-tech"
   # --pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways
   pullPolicy: IfNotPresent
   # --especify the tag of your image to deploy
@@ -48,8 +49,8 @@ nodeSelector: {}
 tolerations: []
 affinity: {}
 
-volumes: []
-volumeMounts: []
+volumes: {}
+volumeMounts: {}
 
 env:
   []
```

## 0.0.2 

**Release date:** 2023-10-25

![AppVersion: 0.0.1](https://img.shields.io/static/v1?label=AppVersion&message=0.0.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hamer: force (#102) 
* :robot: Update Docs 
* :sparkles: Force artifact (#101) 
* :robot: Update Docs 
* Fix now (#100) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-dev/values.yaml b/charts/devxp-dev/values.yaml
index 33ea9aa..851f37a 100644
--- a/charts/devxp-dev/values.yaml
+++ b/charts/devxp-dev/values.yaml
@@ -5,6 +5,9 @@
 # --name is the github repository name of this application deploy
 name: ""
 
+# deployment:
+#   enabled: true
+
 resources:
   requests:
     cpu: "50m"
@@ -12,8 +15,6 @@ resources:
   limits:
     cpu: "100m"
     memory: "256Mi"
-deployment:
-  enabled: true
 
 container:
   # --port is the port your application runs under
@@ -47,6 +48,9 @@ nodeSelector: {}
 tolerations: []
 affinity: {}
 
+volumes: []
+volumeMounts: []
+
 env:
   []
   # examples:
@@ -66,6 +70,7 @@ autoscaling:
 
 imagePullSecrets:
   enabled: false
+  name: {}
 
 probe:
   enabled: true
@@ -73,3 +78,10 @@ probe:
 service:
   port: 80
   type: "ClusterIP"
+
+# --ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
+serviceAccount:
+  # --Specifies whether a service account should be created
+  enabled: true
+  # --Annotations to add to the service account
+  annotations: {}
```

## 0.0.1 

**Release date:** 2023-10-25

![AppVersion: 0.0.1](https://img.shields.io/static/v1?label=AppVersion&message=0.0.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :hammer: fix (#99) 
* :robot: Update Docs 
* :hammer: fix devxp-dev (#98) 
* :hammer: fix sa missing (#97) 
* :robot: Update Docs 

### Default value changes

```diff
diff --git a/charts/devxp-dev/values.yaml b/charts/devxp-dev/values.yaml
index f525b40..33ea9aa 100644
--- a/charts/devxp-dev/values.yaml
+++ b/charts/devxp-dev/values.yaml
@@ -1,4 +1,4 @@
-# Default values for devxp-app.
+# Default values for devxp-dev.
 # This is a YAML-formatted file.
 # Declare variables to be passed into your templates.
 
```

## 0.0.0 

**Release date:** 2023-10-25

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :sparkles: Add devxp-dev (#96) 

### Default value changes

```diff
# Default values for devxp-app.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

# --name is the github repository name of this application deploy
name: ""

resources:
  requests:
    cpu: "50m"
    memory: "128Mi"
  limits:
    cpu: "100m"
    memory: "256Mi"
deployment:
  enabled: true

container:
  # --port is the port your application runs under
  port: 8080

  # --image is the object to specify the image to run in the deployment
image:
  # --repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME
  # if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag
  repository: ""
  # --pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways
  pullPolicy: IfNotPresent
  # --especify the tag of your image to deploy
  tag: "latest"

livenessProbe:
  httpGet:
    path: /health-check/liveness
    port: 8080
  initialDelaySeconds: 15
  periodSeconds: 10

readinessProbe:
  httpGet:
    path: /health-check/readiness
    port: 8080
  initialDelaySeconds: 15
  periodSeconds: 10

nodeSelector: {}
tolerations: []
affinity: {}

env:
  []
  # examples:
  # please note that when the value is a number, you must quote the value to cast to string!
  # - name: ENVIROMENT
  #   value: dev

envFrom:
  []
  # examples:
  # please note that when the value is a number, you must quote the value to cast to string!
  # - configMapRef
  #     name: postgres-configs

autoscaling:
  enabled: false

imagePullSecrets:
  enabled: false

probe:
  enabled: true

service:
  port: 80
  type: "ClusterIP"
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
