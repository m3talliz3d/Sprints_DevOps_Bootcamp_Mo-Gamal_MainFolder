## 1- create a namespace iti-devops

### <u>__Solution__:</u>
```shell
[mgamal@centos-sprints Lab4]$ kubectl create namespace iti-devops
namespace/iti-devops created
```
***
---
## 2- create a service account iti-sa-devops under the same namespace.
### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: iti-sa-devops
  namespace: iti-devops
```
```shell
[mgamal@centos-sprints Lab5]$ kubectl apply -f Lab5_Q2.yaml 
serviceaccount/iti-sa-devops created
```
***
## 3- create a clusteRole which should be named as cluster-role-devops to grant permissions
    “get”,”list”,”watch”,”create”,”patch”,”update” 
    to 
    “configMaps”,”secrets”,”endpoints”,”nodes”,”pods”,”services”,”namespaces”,”events”,”serviceAccounts”.

### <u>__Solution__:</u>
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-role-devops
rules:
  - apiGroups: [""]
    resources: [“configMaps”,”secrets”,”endpoints”,”nodes”,”pods”,”services”,”namespaces”,”events”,”serviceAccounts”]
    verbs: [“get”,”list”,”watch”,”create”,”patch”,”update”]
```

```shell
[mgamal@centos-sprints Lab5]$ kubectl apply -f Lab5_Q3.yaml 
clusterrole.rbac.authorization.k8s.io/cluster-role-devops created
```
***
## 4- create a ClusterRoleBinding which should be named as 
    cluster-role-binding-devops under the same namespace. 
    Define roleRef apiGroup should be rbac.authorization.k8s.io.:
        Kind should be ClusterRole.
        name should be cluster-role-devops.
    subjects kind should be ServiceAccount: 
        name should be iti-sadevops and 
        namespace should be iti-devops

### <u>__Solution__:</u>
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-role-binding-devops
  namespace: iti-devops
subjects:
  - kind: ServiceAccount
    name: iti-sa-devops
    namespace: iti-devops
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: iti-sadevops
```

```shell
[mgamal@centos-sprints Lab5]$ kubectl apply -f Lab5_Q4.yaml 
clusterrolebinding.rbac.authorization.k8s.io/cluster-role-binding-devops created
```
***
## 5- What is the difference between statefulSets and deployments?

### <u>__Solution__:</u>
    Deployments and StatefulSets are resources in Kubernetes for managing containers, but have different purposes. Deployments are used for stateless applications to manage their desired state, ensuring a desired number of replicas are running and available. StatefulSets are used for stateful applications with unique identities and persistent storage, providing predictable and stable deployment and management.
***
## 6- Set up Ingress on Minikube with the NGINX Ingress Controller play around with paths , you can create more than 2 deployments if you like

### <u>__Solution__:</u>

***

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/