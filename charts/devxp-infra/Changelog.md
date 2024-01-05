# Change Log

## Next Release 

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* :robot: Update Docs 
* :robot: Update Docs 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.0.9 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.8 → 0.0.9 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.0.8 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.7 → 0.0.8 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.0.7 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.6 → 0.0.7 
* :robot: Update Docs 

### Default value changes

```diff
# No changes in this release
```

## 0.0.6 

**Release date:** 2023-06-15

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.5 → 0.0.6 
* :hammer: Add Api Notifications (#72) 
* :hammer: Add Api Notifications 
* [ci skip] :robot: [github actions actor] - Update Docs 
* [skip ci] :robot: Update Docs :zap: 
* :zap: Add Chart Bump minor 

### Default value changes

```diff
diff --git a/charts/devxp-infra/values.yaml b/charts/devxp-infra/values.yaml
index 6d05d09..42b58b4 100644
--- a/charts/devxp-infra/values.yaml
+++ b/charts/devxp-infra/values.yaml
@@ -1,8 +1,8 @@
 name: ""
 providerConfigRef: default
 
-Bucket:
+bucket:
   enabled: false
   acl: private
   locationConstraint: us-east-1
-  objectLockEnabledForBucket: false
\ No newline at end of file
+  objectLockEnabledForBucket: false
```

## 0.0.5 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.4 → 0.0.5 
* :zap: Add Chart Bump minor 

### Default value changes

```diff
# No changes in this release
```

## 0.0.4 

**Release date:** 2023-06-01

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump devxp-infra chart version: 0.0.3 → 0.0.4 
* :zap: Add Chart Bump minor 
* :zap: Add Chart Bump minor 
* Update PR Template 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
# No changes in this release
```

## 0.0.3 

**Release date:** 2022-12-23

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-infra]:zap: Update s3 to 0.0.2 
* [devxp-infra]:zap: Update s3 to 0.0.2 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-infra/values.yaml b/charts/devxp-infra/values.yaml
index 7bd48e1..6d05d09 100644
--- a/charts/devxp-infra/values.yaml
+++ b/charts/devxp-infra/values.yaml
@@ -1,2 +1,8 @@
+name: ""
+providerConfigRef: default
+
 Bucket:
-  enabled: false
\ No newline at end of file
+  enabled: false
+  acl: private
+  locationConstraint: us-east-1
+  objectLockEnabledForBucket: false
\ No newline at end of file
```

## 0.0.2 

**Release date:** 2022-12-23

![AppVersion: 1.0.0](https://img.shields.io/static/v1?label=AppVersion&message=1.0.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-infra]:zap: Update s3 to 0.0.2 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-infra/values.yaml b/charts/devxp-infra/values.yaml
index 116f094..7bd48e1 100644
--- a/charts/devxp-infra/values.yaml
+++ b/charts/devxp-infra/values.yaml
@@ -1,2 +1,2 @@
-s3:
+Bucket:
   enabled: false
\ No newline at end of file
```

## 0.0.1 

**Release date:** 2022-12-23

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [devxp-infra]:zap: Update s3 to 0.0.1 
* [skip ci] :robot: Update Docs :zap: 

### Default value changes

```diff
diff --git a/charts/devxp-infra/values.yaml b/charts/devxp-infra/values.yaml
index 06982f0..116f094 100644
--- a/charts/devxp-infra/values.yaml
+++ b/charts/devxp-infra/values.yaml
@@ -1,82 +1,2 @@
-# Default values for devxp-infra.
-# This is a YAML-formatted file.
-# Declare variables to be passed into your templates.
-
-replicaCount: 1
-
-image:
-  repository: nginx
-  pullPolicy: IfNotPresent
-  # Overrides the image tag whose default is the chart appVersion.
-  tag: ""
-
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
-
-autoscaling:
-  enabled: false
-  minReplicas: 1
-  maxReplicas: 100
-  targetCPUUtilizationPercentage: 80
-  # targetMemoryUtilizationPercentage: 80
-
-nodeSelector: {}
-
-tolerations: []
-
-affinity: {}
+s3:
+  enabled: false
\ No newline at end of file
```

## 0.1.1 

**Release date:** 2022-12-20

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [ci] :rocket: Add SonarQube 

### Default value changes

```diff
# No changes in this release
```

## 0.1.0 

**Release date:** 2022-12-20

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* [ci skip] :rocket: Add Services 

### Default value changes

```diff
# Default values for devxp-infra.
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
