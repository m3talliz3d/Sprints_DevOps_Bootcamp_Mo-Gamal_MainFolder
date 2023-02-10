
# Lab 4

## 1- Create a pod red with redis image and use an initContainer that uses the busybox image and sleeps for 20 seconds 

### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: red
  labels:
    app: redis
spec:
      containers:
      - name: redis
        image: redis
      initContainers:
        - name: myinitservice
          image: busybox:latest #usually I use tag
          command: ['sh', '-c', "sleep 20"]
```

```bash
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q1.yaml 
pod/red created
[mgamal@centos-sprints Lab4]$ kubectl get pod red
NAME   READY   STATUS            RESTARTS   AGE
red    0/1     PodInitializing   0          29s
[mgamal@centos-sprints Lab4]$ kubectl get pod red
NAME   READY   STATUS    RESTARTS   AGE
red    1/1     Running   0          37s
```

***

## 2- Create a pod named print-envars-greeting. 
    1. Configure spec as, the container name should be print-env-container and use bash image. 
    2. Create three environment variables: 
        a. GREETING and its value should be “Welcome to ” 
        b. COMPANY and its value should be “DevOps” 
        c. GROUP and its value should be “Industries” 
    3. Use command to echo ["$(GREETING) $(COMPANY) $(GROUP)"] message. 
    4. You can check the output using `kubctl logs -f [ pod-name ]` command 

### <u>__Solution__:</u>

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: print-env-greeting
  labels:
    app: greeting
spec:
      containers:
      - name: greeting
        image: bash
        env:
          - name: GREETING 
            value: "Welcome to"
          - name: COMPANY
            value: "DevOps"
          - name: GROUP
            value: "Industries"
        command: ['sh', '-c', 'echo "$GREETING $COMPANY $GROUP" ']
```

```bash
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q2.yaml 
pod/print-env-greeting created

[mgamal@centos-sprints Lab4]$ kubectl get pod
NAME                 READY   STATUS             RESTARTS     AGE
print-env-greeting   0/1     CrashLoopBackOff   1 (5s ago)   16s

[mgamal@centos-sprints Lab4]$ kubectl logs -f print-env-greeting
Welcome to DevOps Industries
```

***

## 3- Create a Persistent Volume with the given specification. 
    Volume Name: pv-log 
    Storage: 100Mi 
    Access Modes: ReadWriteMany 
    Host Path: /pv/log 

### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-log
  labels:
    app: pv-log
spec:
  accessModes:
    - ReadWriteMany
  capacity:
    storage: 100Mi
  hostPath:
    path: "/pv/log"
  claimRef:
    name: claim-log-1

```

```shell
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q3.yaml 
persistentvolume/pv-log created
```
***

## 4- Create a Persistent Volume Claim with the given specification. 
    Volume Name: claim-log-1 
    Storage Request: 50Mi 
    Access Modes: ReadWriteMany 

### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: claim-log-1
  namespace: default
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: "50Mi"
  selector:
    matchLabels:
      app: pv-log
```
```shell
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q4.yaml 
persistentvolumeclaim/claim-log-1 created
```
***

## 5- Create a webapp pod to use the persistent volume claim as its storage. 
    Name: webapp 
    Image Name: nginx 
    Volume: PersistentVolumeClaim=claim-log-1 
    Volume Mount: /var/log/nginx 

### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: webapp
  labels:
    app: nginx
spec:
  containers:
  - name: webapp-pod
    image: nginx
    volumeMounts:
      - mountPath: /var/log/nginx
        name: vol
  volumes:
    - name: vol
      persistentVolumeClaim:
        claimName: claim-log-1
```

```shell
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q5.yaml 
pod/webapp created
```
***

## 6- How many DaemonSets are created in the cluster in all namespaces? 

### <u>__Solution__:</u>
```shell
[mgamal@centos-sprints Lab4]$ kubectl get DaemonSets --all-namespaces
NAMESPACE     NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-system   kube-proxy   1         1         1       1            1           kubernetes.io/os=linux   26d
```
***

## 7- what DaemonSets exist on the kube-system namespace? 

### <u>__Solution__:</u>
```shell
[mgamal@centos-sprints Lab4]$ kubectl get DaemonSets -n kube-system
NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-proxy   1         1         1       1            1           kubernetes.io/os=linux   26d
```
***

## 8- What is the image used by the POD deployed by the kube-proxy DaemonSet 

### <u>__Solution__:</u>
```shell
[mgamal@centos-sprints Lab4]$ kubectl get DaemonSets -n kube-system -o wide
NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE   CONTAINERS   IMAGES                               SELECTOR
kube-proxy   1         1         1       1            1           kubernetes.io/os=linux   26d   kube-proxy   registry.k8s.io/kube-proxy:v1.25.3   k8s-app=kube-proxy
```
***

## 9- Deploy a DaemonSet for FluentD Logging. Use the given 
    specifications. 
    Name: elasticsearch 
    Namespace: kube-system 
    Image: k8s.gcr.io/fluentd-elasticsearch:1.20 

### <u>__Solution__:</u>
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: elasticsearch
  namespace: kube-system
  labels:
    k8s-app: fluentd
spec:
  selector:
    matchLabels:
      name: fluentd
  template:
    metadata:
      labels:
        name: fluentd
    spec:
      containers:
        - name: fluentd
          image: k8s.gcr.io/fluentd-elasticsearch:1.20
```

```shell
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q9.yaml 
daemonset.apps/elasticsearch created
```
***

## 10- Create a multi-container pod with 2 containers. 
    Name: yellow 
    Container 1 Name: lemon 
    Container 1 Image: busybox 
    Container 2 Name: gold 
    Container 2 Image: redis 

### <u>__Solution__:</u>
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: yellow
spec:
  containers:
    - name: lemon
      image: busybox
      tty: true
    - name: gold
      image: redis
```

```shell
[mgamal@centos-sprints Lab4]$ kubectl apply -f Lab4_Q10.yaml 
pod/yellow created
```
***
<br>

***
<br>

########## Bonus Question  OR if you couldn't Pull MongoDB image yesterday ;) ######## 

## 11- create a POD called db-pod with the image mysql:5.7 then check the POD status 
## 12- why the db-pod status not ready 
## 13- Create a new secret named db-secret with the data given below. 
    Secret Name: db-secret 
    Secret 1: MYSQL_DATABASE=sql01 
    Secret 2: MYSQL_USER=user1 
    Secret3: MYSQL_PASSWORD=password 
    Secret 4: MYSQL_ROOT_PASSWORD=password123 
## 14- Configure db-pod to load environment variables from the newly created 
    secret. 
    Delete and recreate the pod if required