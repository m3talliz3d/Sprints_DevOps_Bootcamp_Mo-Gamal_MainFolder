```
DEMO-mini project + Scheduling LAB3:
Links
    mongodb image on Docker Hub: https://hub.docker.com/_/mongo
mongo:5.0
    webapp image on Docker Hub: https://hub.docker.com/repository/docker/nanajanashia/k8sdemo-app

nanajanashia/k8s-demo-app:v1.0
    k8s official documentation: https://kubernetes.io/docs/home/
    webapp code repo: https://gitlab.com/nanuchi/developing-with-docker/-/tree/feature/k8s-inhour
```

---
---


`01 Create ConfgMap  or MongoDB EndPoint. ( The MondoDB sevice name)`

    DB_URL:mongo-service
    name of clusterIP service attached to db-deployment


---

## Solution:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mongo-confi
data:
  mongo-url: mongo-service
```

---

`02 Create A secret  or MongoDB User & PWD`

    USER_NAME: mongouser
    USER_PWD: mongopassword

## Solution:

```yaml
-- test
apiVersion: v1
kind: Secret
metadata:
  name: mongo-secret
type: Opaque
data:
  mongo-user: bW9uZ291c2Vy
  mongo-password: bW9uZ29wYXNzd29yZA==
```


---

`03 Create MongoDB Deployment Applicaton with Internal service (ClusterIp) Mongo DB needs`

    username + password to operate
    Vars needed in mongoDB:
        MONGO_INITDB_ROOT_USERNAME: root
        MONGO_INITDB_ROOT_PASSWORD: example

## Solution:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-deployment
  labels:
    app: mongo-dev
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-dev
  template:
    metadata:
      labels:
        app: mongo-dev
    spec:
      containers:
      - name: mongodb
        image: mongo:6.0.4
        ports:
        - containerPort: 27017
        env:
          - name: MONGO_INITDB_ROOT_USERNAME
            valueFrom:
              secretKeyRef:
                name: mongo-secret
                key: mongo-user
          - name: MONGO_INITDB_ROOT_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mongo-secret
                key: mongo-password
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-service
spec:
  selector:
    app: mongo-dev
  ports:
    - protocol: TCP
      port: 27017
      targetPort: 27017
```

---

`04 Create webApp  Deployment(FrontEnd( with external service) and it needs to access MongoDb, so it needs username+ password + mongodb endpoint (mongodb service) container runs on 3000`

## Solution:

```yaml
--- webapp.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp-dev
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp-dev
  template:
    metadata:
      labels:
        app: webapp-dev
    spec:
      containers:
      - name: webapp
        image: nanajanashia/k8s-demo-app:v1.0
        ports:
        - containerPort: 3000
        env:
          - name: USER_NAME
            valueFrom:
              secretKeyRef:
                name: mongo-secret
                key: mongo-user
          - name: USER_PWD
            valueFrom:
              secretKeyRef:
                name: mongo-secret
                key: mongo-password
          - name: DB_URL
            valueFrom:
              configMapKeyRef:
                name: mongo-config
                key:  mongo-url
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
spec:
  type: NodePort
  selector:
    app: webapp-dev
  ports:
    - protocol: TCP
      port: 3000
      targetPort: 3000
      nodePort: 30000
```

---

`08- How many Nodes exist on the system?`

## Solution:

```bash
[mgamal@centos-sprints Lab3]$ kubectl get node -o wide
NAME       STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION          CONTAINER-RUNTIME
minikube   Ready    control-plane   25d   v1.25.3   192.168.49.2   <none>        Ubuntu 20.04.5 LTS   4.18.0-448.el8.x86_64   docker://20.10.20
```

---

`09- Do you see any taints on master ?`

## Solution:
```bash
[mgamal@centos-sprints ~]$ kubectl describe node minikube
Name:               minikube
Roles:              control-plane
Taints:             <none>
```
---

`10- Apply a label color=blue to the master node`

## Solution:
```bash
[mgamal@centos-sprints ~]$ kubectl label nodes minikube color=blue
node/minikube labeled

[mgamal@centos-sprints ~]$ kubectl describe node minikube
Name:               minikube
Roles:              control-plane
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    color=blue
.
.
.
                    node-role.kubernetes.io/control-plane=
                    node.kubernetes.io/exclude-from-external-load-balancers=
```
---

`11- Create a new deployment named blue with the nginx image and 3 replicasSet Node Afnity to the deployment to place the pods on master only`

    NodeAfnity: requiredDuringSchedulingIgnoredDuringExecuton
    Key: color
    values: blue

## Solution: 
```yaml

--- yaml file:

apiVersion: apps/v1
kind: Deployment
metadata:
  name: blue
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: color
                    operator: In
                    values:
                    - blue
```
```bash
--- Execute code:

[mgamal@centos-sprints Lab3]$ kubectl apply -f nginx-nodeAffBlue.yaml
deployment.apps/blue created


```

---

`12- Create a taint on node01 with key o  spray, value o  mortein and efect o 
NoSchedule`

## Solution:
```bash
controlplane $ kubectl taint node node01 spray mortein:NoSchedule
node/node01 tainted
```
---

`13- Create a new pod with the NGINX image, and Pod name as
mosquito`

## Solution:
```bash
[mgamal@centos-sprints Lab3]$ kubectl run mosquito --image=nginx
pod/mosquito created

```
---

`14- What is the state o  the mosquito POD?`

## Solution:
```bash
[mgamal@centos-sprints Lab3]$ kubectl get pod
NAME                                READY   STATUS    RESTARTS        AGE
mosquito                            1/1     Running   0               9s
```
---

`15- Create another pod named bee with the NGINX image, which has a toleraton set to the taint Mortein`

    Image name: nginx
    Key: spray
    Value: mortein
    Efect: NoSchedule
    Status: Running

## Solution:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bee
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
      tolerations:
        - key: "spray"
          operator: "Equal"
          value: "mortein"
          effect: "NoSchedule"
```
```bash
[mgamal@centos-sprints Lab3]$ kubectl apply -f bee-tolrant.yaml 
deployment.apps/bee created

[mgamal@centos-sprints Lab3]$ kubectl get pod 
NAME                                READY   STATUS    RESTARTS        AGE
bee-67978fc687-59nqm                1/1     Running   0               24s
bee-67978fc687-8fgcg                1/1     Running   0               24s
bee-67978fc687-ktrgr                1/1     Running   0               24s
```