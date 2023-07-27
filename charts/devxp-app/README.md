# devxp-app

![Version: 0.2.19](https://img.shields.io/badge/Version-0.2.19-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm Charts for default DevXP-Tech Application

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| diegoluisi | <contato@diegoluisi.eti.br> | <www.diegoluisi.eti.br> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| argoRollouts | object | `{"analyses":{"enabled":true,"failureLimit":3,"successCondition":0.95},"dynamicStableScale":true,"enabled":true,"revisionHistoryLimit":5,"strategy":{"steps":[{"setWeight":5},{"pause":{"duration":"10s"}},{"setWeight":20},{"pause":{"duration":"10s"}},{"setWeight":40},{"pause":{"duration":"10s"}},{"setWeight":60},{"pause":{"duration":"10s"}},{"setWeight":80},{"pause":{"duration":"10s"}}]}}` | argoRollouts enable Argo Rollouts Deployment |
| argoRollouts.enabled | bool | `true` | Specifies whether a resource quota should be created |
| autoscaling | object | `{"customRules":[],"enabled":true,"maxReplicas":2,"minReplicas":1,"targetCPUUtilizationPercentage":80,"targetMemoryUtilizationPercentage":80}` | autoscaling is the main object of autoscaling |
| autoscaling.customRules | list | `[]` | customRules is a place to customize your application autoscaler using the original API available at: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/ |
| autoscaling.enabled | bool | `true` | enabled is the flag to sinalize this funcionality is enabled |
| autoscaling.maxReplicas | int | `2` | maxReplicas is the number of maximum scaling pods |
| autoscaling.minReplicas | int | `1` | minReplicas is the number of mim pods to be running |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | targetCPUUtilizationPercentage is the percentage of cpu when reached to scale new pods |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | targetMemoryUtilizationPercentage is the percentage of memoty when reached to scale new pods |
| consumers | object | `{"list":[],"terminationGracePeriodSeconds":30}` | consumers is the object to configure an array of consumers |
| consumers.list | list | `[]` | list is the array of consumer definition |
| consumers.terminationGracePeriodSeconds | int | `30` | terminationGracePeriodSeconds configures terminationGracePeriodSeconds |
| container.port | int | `8080` | port is the port your application runs under |
| cronjobs.list | list | `[]` | list is an array of spec for create multiples cronjobs |
| cronjobs.suspend | bool | `false` | suspend used to disable all cronjobs in the list |
| deployment | object | `{"annotations":{},"enabled":false}` | deployment Disabled Deployment |
| deployment.enabled | bool | `false` | enabled default false |
| envFrom | list | `[]` |  |
| envs | list | `[]` |  |
| fullnameOverride | object | `{}` |  |
| global.cluster | string | `"cluster.local"` | cluster Set Cluster Name |
| global.commonLabels | object | `{}` | commonLabels set common labels for all resources |
| global.istio | bool | `true` |  |
| global.prometheus | object | `{"server":"http://prometheus-server.monitoring"}` | prometheus set prometheus server url |
| image.pullPolicy | string | `"IfNotPresent"` | pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways |
| image.repository | string | `""` | repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag |
| image.tag | string | `"latest"` | especify the tag of your image to deploy |
| imagePullSecrets | object | `{"enabled":true,"name":"ghcr-secret"}` | imagePullSecrets secret used to download image on private container registry |
| imagePullSecrets.enabled | bool | `true` | imagePullSecrets.enabled create secret do pull docker images in private registrys |
| livenessProbe.httpGet.path | string | `"/health-check/liveness"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `15` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| migration | object | `{"enabled":false}` | migration Set liquibase migration |
| migration.enabled | bool | `false` | enable liquibase migration |
| name | string | `""` | name is the github repository name of this application deploy |
| nameOverride | object | `{}` |  |
| namespace | object | `{"annotations":{},"enabled":true,"labels":{}}` | namespace |
| network | object | `{"domain":"devxp-tech.io","gateways":"istio-system/istio-ingressgateway","service":{"nodePort":{},"port":80,"type":"ClusterIP"}}` | Network |
| network.domain | string | `"devxp-tech.io"` | domain Set Default Domain |
| network.gateways | string | `"istio-system/istio-ingressgateway"` | gateways set default gateway for virtual-service |
| network.service | object | `{"nodePort":{},"port":80,"type":"ClusterIP"}` | service An abstract way to expose an application running on a set of Pods as a network service. |
| network.service.port | int | `80` | port is the port your application runs under |
| nodeSelector | object | `{}` |  |
| peerAuthentication | object | `{"enabled":true}` | PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar. |
| peerAuthentication.enabled | bool | `true` | enable PeerAuthentication |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` | A security context defines privilege and access control settings for a Pod or Container. About more: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| probe.enabled | bool | `true` |  |
| quota | object | `{"enabled":true,"resources":{"hard":{"limits.cpu":"2","limits.memory":"2Gi","requests.cpu":"1","requests.memory":"1Gi"}}}` | ResourceQuota provides constraints that limit aggregate resource consumption per namespace |
| quota.enabled | bool | `true` | Specifies whether a resource quota should be created |
| quota.resources | object | `{"hard":{"limits.cpu":"2","limits.memory":"2Gi","requests.cpu":"1","requests.memory":"1Gi"}}` | resources Specifies the hard resources |
| readinessProbe.httpGet.path | string | `"/health-check/readiness"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `15` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| replicaCount | int | `1` | replicaCount is used when autoscaling.enabled is false to set a manually number of pods |
| resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"50m","memory":"64Mi"}}` | resources set deployment resources |
| sealedSecrets | object | `{"enabled":true,"encryptedData":"AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg=="}` | sealedSecrets enable creation of a secret to pull images |
| sealedSecrets.enabled | bool | `true` | enabled create a Sealed Secret in the namespace |
| sealedSecrets.encryptedData | string | `"AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg=="` | encryptedData hash to create secret |
| securityContext | object | `{}` | fsGroup: 2000 |
| service.annotations | object | `{}` |  |
| service.externalDns.enabled | bool | `false` |  |
| service.labels | object | `{}` |  |
| serviceAccount | object | `{"annotations":{},"enabled":true}` | ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.enabled | bool | `true` | Specifies whether a service account should be created |
| tolerations | list | `[]` |  |
| virtualServices.custom.hosts | list | `[]` |  |
| volumeMounts | list | `[]` | volumeMounts specifies where Kubernetes will mount Pod volumes |
| volumes | list | `[]` | volumes specifies pod volumes |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
