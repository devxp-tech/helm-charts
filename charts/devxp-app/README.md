# devxp-app

![Version: 0.2.84](https://img.shields.io/badge/Version-0.2.84-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm Charts for default DevXP-Tech Application

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| diegoluisi | <contato@diegoluisi.eti.br> | <www.diegoluisi.eti.br> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| actuator.enabled | bool | `false` | If enabled, create default actuator path and metrics |
| actuator.liveness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| actuator.liveness.httpHeaders | list | `[]` |  |
| actuator.liveness.initialDelaySeconds | int | `120` | Number of seconds after the container has started before readiness probes are initiated |
| actuator.liveness.path | string | `"/actuator/health/liveness"` | The path to check liveness of the application |
| actuator.liveness.periodSeconds | int | `10` | How often (in seconds) to perform the readiness probe |
| actuator.liveness.scheme | string | `"HTTP"` | The scheme to use for the readiness probe (e.g., HTTP or HTTPS) |
| actuator.liveness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed |
| actuator.liveness.timeoutSeconds | int | `3` | Number of seconds after which the readiness probe times out |
| actuator.metrics.path | string | `"/actuator/prometheus"` | The path to expose Prometheus metrics |
| actuator.port.name | string | `"tcp-metrics"` | The name of the port for actuator metrics |
| actuator.port.port | int | `9090` | The port number for actuator metrics |
| actuator.port.protocol | string | `"TCP"` | The protocol used to service |
| actuator.port.targetPort | int | `9090` | The target port in the container for actuator metrics |
| actuator.readiness.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| actuator.readiness.httpHeaders | list | `[]` |  |
| actuator.readiness.initialDelaySeconds | int | `120` | Number of seconds after the container has started before readiness probes are initiated |
| actuator.readiness.path | string | `"/actuator/health/readiness"` | The path to check readiness of the application |
| actuator.readiness.periodSeconds | int | `10` | How often (in seconds) to perform the readiness probe |
| actuator.readiness.scheme | string | `"HTTP"` | The scheme to use for the readiness probe (e.g., HTTP or HTTPS) |
| actuator.readiness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed |
| actuator.readiness.timeoutSeconds | int | `3` | Number of seconds after which the readiness probe times out |
| affinity | object | `{}` | affinity allows you to define rules for pod scheduling based on node labels |
| argoRollouts | object | `{"analyses":{"enabled":true,"failureLimit":3,"initialDelay":"30s","interval":"20s","metricName":"success-rate","successCondition":"len(result) == 0 || isNaN(result[0]) || isInf(result[0]) || result[0] >= 0.95"},"dynamicStableScale":true,"enabled":true,"revisionHistoryLimit":3,"strategy":{"steps":[{"setWeight":5},{"pause":{"duration":"10s"}},{"setWeight":20},{"pause":{"duration":"10s"}},{"setWeight":40},{"pause":{"duration":"10s"}},{"setWeight":60},{"pause":{"duration":"10s"}},{"setWeight":80},{"pause":{"duration":"10s"}}]}}` | argoRollouts enable Argo Rollouts Deployment |
| argoRollouts.analyses.enabled | bool | `true` | Specifies whether analysis runs should be created during the rollout |
| argoRollouts.analyses.failureLimit | int | `3` | Specifies the maximum number of failed analysis runs allowed before the rollout fails |
| argoRollouts.analyses.successCondition | string | `"len(result) == 0 || isNaN(result[0]) || isInf(result[0]) || result[0] >= 0.95"` | Specifies the success condition for the analysis, as a percentage |
| argoRollouts.dynamicStableScale | bool | `true` | Specifies whether the stable ReplicaSet should be dynamically scaled during rollout |
| argoRollouts.enabled | bool | `true` | Specifies whether Argo Rollouts is enabled |
| argoRollouts.revisionHistoryLimit | int | `3` | Specifies the number of old ReplicaSets to retain for rollback purposes |
| argoRollouts.strategy.steps[0] | object | `{"setWeight":5}` | Sets the percentage of traffic to send to the new version |
| argoRollouts.strategy.steps[1] | object | `{"pause":{"duration":"10s"}}` | Pauses the rollout for a specified duration |
| argoRollouts.strategy.steps[2] | object | `{"setWeight":20}` | Sets the percentage of traffic to send to the new version |
| argoRollouts.strategy.steps[3] | object | `{"pause":{"duration":"10s"}}` | Pauses the rollout for a specified duration |
| argoRollouts.strategy.steps[4] | object | `{"setWeight":40}` | Sets the percentage of traffic to send to the new version |
| argoRollouts.strategy.steps[5] | object | `{"pause":{"duration":"10s"}}` | Pauses the rollout for a specified duration |
| argoRollouts.strategy.steps[6] | object | `{"setWeight":60}` | Sets the percentage of traffic to send to the new version |
| argoRollouts.strategy.steps[7] | object | `{"pause":{"duration":"10s"}}` | Pauses the rollout for a specified duration |
| argoRollouts.strategy.steps[8] | object | `{"setWeight":80}` | Sets the percentage of traffic to send to the new version |
| argoRollouts.strategy.steps[9] | object | `{"pause":{"duration":"10s"}}` | Pauses the rollout for a specified duration |
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
| container.readOnlyRootFilesystem | bool | `true` |  |
| cronjobs.list | list | `[]` | list is an array of spec for create multiples cronjobs |
| cronjobs.suspend | bool | `false` | suspend used to disable all cronjobs in the list |
| deployment | object | `{"annotations":{},"enabled":false}` | deployment Disabled Deployment |
| deployment.annotations | object | `{}` | Annotations to be added to the deployment |
| deployment.enabled | bool | `false` | default is false |
| envFrom | list | `[]` |  |
| envs | list | `[]` |  |
| fullnameOverride | object | `{}` | fullnameOverride allows full override of the name |
| global.cluster | string | `"cluster.local"` | cluster sets the Cluster Name |
| global.commonLabels | object | `{}` | commonLabels sets common labels for all resources |
| global.network | object | `{"domain":"devxp-tech.io"}` | Network configuration |
| global.network.domain | string | `"devxp-tech.io"` | domain sets the Default Domain |
| global.otel | object | `{"endpoint":"http://otel-collector.observability.svc.cluster.local:4317"}` | otel sets the endpoint for OpenTelemetry collector |
| global.prometheus | object | `{"server":"http://mimir-nginx.monitoring.svc:80/prometheus"}` | prometheus sets the Prometheus server URL |
| global.prometheus.server | string | `"http://mimir-nginx.monitoring.svc:80/prometheus"` | server sets prometheus endpoint |
| image.pullPolicy | string | `"IfNotPresent"` | pullPolicy is the prop to setup the behavior of pull police. options is: IfNotPresent \| allways |
| image.repository | string | `""` | repository: is the registry of your application ex:556684128444.dkr.ecr.us-east-1.amazonaws.com/YOU-APP-ECR-REPO-NAME if empty this helm will auto generate the image using aws.registry/values.name:values.image.tag |
| image.tag | string | `"latest"` | especify the tag of your image to deploy |
| imagePullSecrets | object | `{"enabled":true,"name":"ghcr-secret"}` | imagePullSecrets secret used to download image on private container registry |
| imagePullSecrets.enabled | bool | `true` | imagePullSecrets.enabled create secret do pull docker images in private registrys |
| instrumentation | object | `{}` | instrumentation set default auto-instrumentation, allowed values dotnet, go, java, nodejs and python |
| istio | object | `{"enabled":true,"gateways":"istio-ingress/istio-ingressgateway","peerAuthentication":{"enabled":true,"mode":"PERMISSIVE"},"virtualServices":{"custom":{"hosts":[]},"enabled":true}}` | istio Set default Istio |
| istio.gateways | string | `"istio-ingress/istio-ingressgateway"` | gateways set default gateway for virtual-service |
| istio.peerAuthentication | object | `{"enabled":true,"mode":"PERMISSIVE"}` | PeerAuthentication defines how traffic will be tunneled (or not) to the sidecar. |
| istio.peerAuthentication.enabled | bool | `true` | enable peerAuthentication |
| istio.peerAuthentication.mode | string | `"PERMISSIVE"` | set peerAuthentication mode, values (UNSET, DISABLE, PERMISSIVE, STRICT) |
| istio.virtualServices | object | `{"custom":{"hosts":[]},"enabled":true}` | istio.virtualServices Set Istio virtualServices parameters |
| istio.virtualServices.enabled | bool | `true` | istio.virtualServices.enable Set Istio virtualServices enabled |
| livenessProbe | object | `{"enabled":true,"exec":{},"failureThreshold":3,"httpHeaders":[],"initialDelaySeconds":10,"path":"/health-check/liveness","periodSeconds":10,"scheme":"HTTP","successThreshold":1,"timeoutSeconds":3}` | livenessProbe indicates whether the application is running and alive |
| livenessProbe.enabled | bool | `true` | Specifies whether the liveness probe is enabled |
| livenessProbe.exec | object | `{}` | Specifies a command to run inside the container to determine liveness |
| livenessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| livenessProbe.initialDelaySeconds | int | `10` | Number of seconds after the container has started before liveness probes are initiated |
| livenessProbe.path | string | `"/health-check/liveness"` | The HTTP path to check for liveness |
| livenessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the liveness probe |
| livenessProbe.scheme | string | `"HTTP"` | The scheme to use for the liveness probe (e.g., HTTP or HTTPS) |
| livenessProbe.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed |
| livenessProbe.timeoutSeconds | int | `3` | Number of seconds after which the liveness probe times out |
| migration | object | `{"enabled":false}` | migration Set liquibase migration |
| migration.enabled | bool | `false` | migration.enable liquibase migration |
| monitoring | object | `{"alerts":{"annotations":{},"enabled":false,"labels":{},"namespace":null},"rules":{"additionalGroups":[],"alerting":true,"annotations":{},"enabled":false,"labels":{},"namespace":null},"serviceMonitor":{"annotations":{},"enabled":false,"extraPort":{"enabled":false,"name":"tcp-metrics","number":9090,"protocol":"TCP","targetPort":9090},"interval":"60s","labels":{},"namespace":null,"namespaceSelector":{},"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"15s"}}` | monitoring Enable Monitoring Features |
| monitoring.alerts.annotations | object | `{}` | Additional annotations for the alerts PrometheusRule resource |
| monitoring.alerts.enabled | bool | `false` | If enabled, create PrometheusRule resource with app alerting rules |
| monitoring.alerts.labels | object | `{}` | Additional labels for the alerts PrometheusRule resource |
| monitoring.alerts.namespace | string | `nil` | Alternative namespace to create alerting rules PrometheusRule resource in |
| monitoring.rules.additionalGroups | list | `[]` | Additional groups to add to the rules file |
| monitoring.rules.alerting | bool | `true` | Include alerting rules |
| monitoring.rules.annotations | object | `{}` | Additional annotations for the rules PrometheusRule resource |
| monitoring.rules.enabled | bool | `false` | If enabled, create PrometheusRule resource with app recording rules |
| monitoring.rules.labels | object | `{}` | Additional labels for the rules PrometheusRule resource |
| monitoring.rules.namespace | string | `nil` | Alternative namespace to create recording rules PrometheusRule resource in |
| monitoring.serviceMonitor.annotations | object | `{}` | ServiceMonitor annotations |
| monitoring.serviceMonitor.enabled | bool | `false` | If enabled, ServiceMonitor resources for Prometheus Operator are created |
| monitoring.serviceMonitor.extraPort | object | `{"enabled":false,"name":"tcp-metrics","number":9090,"protocol":"TCP","targetPort":9090}` | ServiceMonitor will use these tlsConfig settings to make the health check requests |
| monitoring.serviceMonitor.interval | string | `"60s"` | ServiceMonitor scrape interval |
| monitoring.serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| monitoring.serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor resources |
| monitoring.serviceMonitor.namespaceSelector | object | `{}` | Namespace selector for ServiceMonitor resources |
| monitoring.serviceMonitor.path | string | `"/metrics"` | ServiceMonitor path to scrape |
| monitoring.serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabel configs to apply to samples before scraping https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#relabelconfig |
| monitoring.serviceMonitor.scheme | string | `"http"` | ServiceMonitor will use http by default, but you can pick https as well |
| monitoring.serviceMonitor.scrapeTimeout | string | `"15s"` | ServiceMonitor scrape timeout in Go duration format (e.g. 15s) |
| name | string | `""` | name is the GitHub repository name of this application deployment |
| nameOverride | object | `{}` | nameOverride allows partial override of the name |
| namespace | object | `{"annotations":{},"enabled":true,"labels":{}}` | namespace configuration |
| namespace.annotations | object | `{}` | Annotations to be added to the namespace |
| namespace.enabled | bool | `true` | Specifies whether the namespace is enabled |
| namespace.labels | object | `{}` | Labels to be added to the namespace |
| nodeSelector | object | `{}` | nodeSelector allows you to constrain a Pod to only be able to run on particular node(s) |
| podAnnotations | object | `{}` | podAnnotations adds custom annotations to the pod |
| podSecurityContext | object | `{}` | A security context defines privilege and access control settings for a Pod or Container. About more: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| quota | object | `{"enabled":true,"resources":{"hard":{"limits.cpu":"2","limits.memory":"2Gi","requests.cpu":"1","requests.memory":"1Gi"}}}` | ResourceQuota provides constraints that limit aggregate resource consumption per namespace |
| quota.enabled | bool | `true` | Specifies whether a resource quota should be created |
| quota.resources | object | `{"hard":{"limits.cpu":"2","limits.memory":"2Gi","requests.cpu":"1","requests.memory":"1Gi"}}` | resources Specifies the hard resources |
| quota.resources.hard."limits.cpu" | string | `"2"` | limits.cpu Specifies the total CPU limits allowed for all pods in the namespace |
| quota.resources.hard."limits.memory" | string | `"2Gi"` | limits.memory Specifies the total memory limits allowed for all pods in the namespace |
| quota.resources.hard."requests.cpu" | string | `"1"` | requests.cpu Specifies the total CPU requests allowed for all pods in the namespace |
| quota.resources.hard."requests.memory" | string | `"1Gi"` | requests.memory Specifies the total memory requests allowed for all pods in the namespace |
| readinessProbe | object | `{"enabled":true,"exec":{},"failureThreshold":3,"httpHeaders":[],"initialDelaySeconds":10,"path":"/health-check/readiness","periodSeconds":10,"scheme":"HTTP","successThreshold":1,"timeoutSeconds":3}` | readinessProbe indicates whether the application is ready to serve requests |
| readinessProbe.enabled | bool | `true` | Specifies whether the readiness probe is enabled |
| readinessProbe.exec | object | `{}` | Specifies a command to run inside the container to determine readiness |
| readinessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the probe to be considered failed after having succeeded |
| readinessProbe.initialDelaySeconds | int | `10` | Number of seconds after the container has started before readiness probes are initiated |
| readinessProbe.path | string | `"/health-check/readiness"` | The HTTP path to check for readiness |
| readinessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the readiness probe |
| readinessProbe.scheme | string | `"HTTP"` | The scheme to use for the readiness probe (e.g., HTTP or HTTPS) |
| readinessProbe.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed |
| readinessProbe.timeoutSeconds | int | `3` | Number of seconds after which the readiness probe times out |
| replicaCount | int | `1` | replicaCount is used when autoscaling.enabled is false to set a manually number of pods |
| resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"50m","memory":"64Mi"}}` | resources set deployment resources |
| resources.limits | object | `{"cpu":"100m","memory":"128Mi"}` | Resource limits are the maximum amount of CPU and memory that the container is allowed to use |
| resources.limits.cpu | string | `"100m"` | The maximum amount of CPU the container can use |
| resources.limits.memory | string | `"128Mi"` | The maximum amount of memory the container can use |
| resources.requests | object | `{"cpu":"50m","memory":"64Mi"}` | Resource requests are the minimum amount of CPU and memory that Kubernetes guarantees for the container |
| resources.requests.cpu | string | `"50m"` | The amount of CPU requested for the container |
| resources.requests.memory | string | `"64Mi"` | The amount of memory requested for the container |
| sealedSecrets | object | `{"enabled":true,"encryptedData":"AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg=="}` | sealedSecrets enable creation of a secret to pull images |
| sealedSecrets.enabled | bool | `true` | enabled create a Sealed Secret in the namespace |
| sealedSecrets.encryptedData | string | `"AgDGBqpFurhI5BktCG/olnD7r2MuhAel/zkL1IL0BxrcaDUmR8JUf3TEkMqKbiRgb9iKYcwX7zVOXI4xDJeiyWyWDbckn8Yc+RBTw7qpKhh3kMUasPVo9blEcrKq4HjSEAEKapegBDT+H1LhjUToDoqwXVmGFEVYpiHtb0OA0OCtUuDZ2dYD4cLpMSVgZ/8hRfilRdD4PqXD+k1NEVZfRgKGl9fV0mazKm9e7w0rRI1brryhWx9+VZcvSi6RLHiELX7VOObxxjQ0W4gCuHKDRztgHoNDR+KVNum6YpVz8vOXQ/XpBxlASundsryNBAVcPwv0HYQDmsNFfMwXaLkLA+Hg6frWXi1CJvSrJc45U8RQ2sAfbCN6QQw1r6O+Lgqc2hmWnx3RzOva6zIq2UqUNRDrKxn99zZUCU4GpmVLFnj08ogq0p86zUXqzA6o1Qz1KRZu2S0QaQQyMquN4vqByXRfbXrgG5rtQRALsRG3o7q7OfOoy1sa1mF6kMyktpbawE7eT0k0FGPdjEtgg5FzLD88pj5OphL1aNTVzgSLVMpT0KY8GHVlB5AlMxz+ilB0bfSs+S5fGsY5u4iOpUAioAQ2lZH/aK8tMMug4pCRsYvDD6AUWlCupzGHhjVNeWDvhGpUG8anpr0htCxqLAGLJaMGV/hcuwbRzdxgKbPjqd/HFpzwi9ZN17IN1vtQhGm3xR781WTBAeLzU7XykzLh8VuUPhS6c8vdNsXXXYubSXrCAddAycXc5YThp/TzfOlPzn/3kkQZZRKUs3Qp393djTaEG75W/CpnQXG4Pnvk9a4swUCm2ZwNYCZdCjBccutcahlKa8mNG4sDeYbpLOG4ZICo2MuKNoJG2DqmemSUGKeThSyhW8v2CjoKqKhGSKbpUjI43c5dK4TueC88DYMZGX2TF5yOtXwmQbjsutAd3n2ELujLpg=="` | encryptedData hash to create secret |
| securityContext | object | `{}` | fsGroup: 2000 |
| service | object | `{"annotations":{},"enabled":true,"externalDns":{"enabled":false},"labels":{},"nodePort":{},"port":{"name":"tcp-node","port":80},"type":"ClusterIP"}` | service |
| service.annotations | object | `{}` | Annotations to add to the service |
| service.enabled | bool | `true` | service.enabled to enable and disable the creation of service |
| service.externalDns | object | `{"enabled":false}` | service.externalDns to enable and disable the creation of external DNS |
| service.externalDns.enabled | bool | `false` | Enable or disable external DNS for the service |
| service.labels | object | `{}` | Labels to add to the service |
| service.nodePort | object | `{}` | The port to expose on each node in a cluster, only used if type is NodePort or LoadBalancer |
| service.port | object | `{"name":"tcp-node","port":80}` | service.port Define the Service Port |
| service.port.name | string | `"tcp-node"` | Name of the port, used for service discovery |
| service.port.port | int | `80` | Port is the port your application runs under |
| service.type | string | `"ClusterIP"` | Service An abstract way to expose an application running on a set of Pods as a network service. |
| serviceAccount | object | `{"annotations":{},"automountServiceAccountToken":true,"enabled":true,"name":{}}` | ServiceAccount A service account provides an identity for processes that run in a Pod, about more: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automountServiceAccountToken | bool | `true` | serviceAccount.annotations Automont Service Account Token |
| serviceAccount.enabled | bool | `true` | Specifies whether a service account should be created |
| tolerations | list | `[]` | tolerations allows the pods to schedule onto nodes with taints |
| volumeMounts | list | `[]` | volumeMounts specifies where Kubernetes will mount Pod volumes |
| volumes | list | `[]` | volumes specifies pod volumes |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
