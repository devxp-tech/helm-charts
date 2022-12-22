# devxp-app

![Version: 0.1.37](https://img.shields.io/badge/Version-0.1.37-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm Charts for default DevXP-Tech Application

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| diegoluisi | contato@diegoluisi.eti.br |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| PeerAuthentication | object | `{"enabled":true}` | PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar. |
| PeerAuthentication.enabled | bool | `true` | enable PeerAuthentication |
| ResourceQuota | object | `{"enabled":true,"hard":{"limits.cpu":"2","limits.memory":"2Gi","requests.cpu":"1","requests.memory":"1Gi"}}` | ResourceQuota provides constraints that limit aggregate resource consumption per namespace |
| ResourceQuota.enabled | bool | `true` | Specifies whether a resource quota should be created |
| ServiceAccount | object | `{"annotations":{},"enabled":true}` | ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| ServiceAccount.annotations | object | `{}` | Annotations to add to the service account |
| ServiceAccount.enabled | bool | `true` | Specifies whether a service account should be created |
| affinity | object | `{}` |  |
| autoscaling | object | `{"enabled":true,"maxReplicas":4,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | autoscaling is the main object of autoscaling |
| autoscaling.enabled | bool | `true` | enabled is the flag to sinalize this funcionality is enabled |
| autoscaling.maxReplicas | int | `4` | maxReplicas is the number of maximum scaling pods |
| autoscaling.minReplicas | int | `2` | minReplicas is the number of mim pods to be running |
| autoscaling.targetCPUUtilizationPercentage | int | `70` | targetCPUUtilizationPercentage is the percentage of CPU utilization do Scaling |
| cluster | string | `"lgsk8sp1.grupologos.local"` | cluster Set Cluster Name |
| container.port | int | `8080` | port is the port your application runs under |
| domain | string | `"diegoluisi.eti.br"` | domain Set Default Domain |
| env | list | `[]` |  |
| envFrom | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` | pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways |
| image.repository | string | `""` | repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag |
| image.tag | string | `"latest"` | especify the tag of your image to deploy |
| imagePullSecrets.name | string | `"ghcr-secret"` |  |
| ingress | object | `{"enabled":true}` | ingress Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. |
| ingress.enabled | bool | `true` | enable ingress |
| livenessProbe.httpGet.path | string | `"/health-check/liveness"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `15` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| name | string | `""` | name is the github repository name of this application deploy |
| nodeSelector | object | `{}` |  |
| probe.enabled | bool | `true` |  |
| readinessProbe.httpGet.path | string | `"/health-check/readiness"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `15` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| rollout | object | `{"enabled":true}` | ResourceQuota provides constraints that limit aggregate resource consumption per namespace |
| rollout.enabled | bool | `true` | Specifies whether a resource quota should be created |
| sealedSecrets | string | `"AgC/rR4wh04d2uNrvV78W9Gx1Gpt92jY3QtdVjV2Vl3mdk5T/IvuU6zFbsE06KNzyfBgczUyOPWSnJKDo8h88NHf02CvZLanjBsI5YbuvyIM5/Vjq5QYAb6iiAamRajAreqTqzY/b8oIAqDfK53hbQy0PteF5Xj/TVJ4bkiKROBoBPTVFPH4Af4QMVzfmyeuSSfyDd7FWNn4cahBPXjCA57fxeCQnboMfpUdpOoaNtHF3aPwlAYvZpPFZ2kVx52T1v659DWWhBINqPtoy7fgSeYWLsvZSrHBx8+EQcAuZ01Z2jfxMig2PEW/anG+wB203sJOlMk2Ot6VN3TiOodR1PrIypFzYmg7l4kRU+AjctTZc8RwEb/Jgfa/sE7G0GhUTDqrNB8etX7sYFCiX9W/L75TNlS0z+bzfYpe61fFX2yYO6mbO39bNTetRE2OaQNMGOTSzJVrZ1EolN8UJzmLAgkbezuPoTs+V1DaIVzP2vVdOXtR6ifrbFiyPpH953+SMK19fP2i8p8ledHXAsvOep/zTWMatSJ4wmrs9CiggMvpQ1GdNwVP6mHnsUVKolFMtWLhPQR4J1waRMgQflj7Mt2ZF9CMCYf56pGWv9fQZoqDJvm6XN2Cb+TLY0ukCJWU++c7U6xtsbx8v/DtY9G3EjiTCWb/ex6EgXAqB9HVgVaYmMmlCSCBbZNF8btFoRLv5RCAdoV6HWe+EL0W4EGNySJYuVJ/771tYx0l48jshVmrcMJzt1JjYI/3+Jnpuoi6rYnjYclp0rjlz+TUOO1UCbGIPAoZcxBRZ0InTBtgmAqZX6ozzwCfansbxmDlgKbSHcrvw3e45A=="` |  |
| service | object | `{"port":80}` | service An abstract way to expose an application running on a set of Pods as a network service. |
| service.port | int | `80` | port is the port your application runs under |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.7.0](https://github.com/norwoodj/helm-docs/releases/v1.7.0)
