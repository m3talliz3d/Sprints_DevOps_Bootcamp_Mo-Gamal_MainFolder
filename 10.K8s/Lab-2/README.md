### 01- How many Namespaces exist on the system?
![K8s_L2_Q_01.png](K8s_L2_Q_01.png)

---

### 02-How many pods exist in the kube-system namespace?
![K8s_L2_Q_02.png](K8s_L2_Q_02.png)

---

### 03- create a Deployment with
``` 
name= deployment-1
image= busybox
replicas= 3
```
![K8s_L2_Q_03.png](K8s_L2_Q_03.png)

---


### 04- How many Deployments and ReplicaSets exist on the system now?
![K8s_L2_Q_04.png](K8s_L2_Q_04.png)

---

### 05- How many pods are ready with the deployment-1?
![K8s_L2_Q_05.png](K8s_L2_Q_05.png)

---

### 06- Update deployment-1 image to nginx then check the ready pods again
![K8s_L2_Q_06.png](K8s_L2_Q_06.png)

---

### 07- Run kubectl describe deployment deployment-1 and check events, What is the deployment strategy used to upgrade the deployment-1?
![K8s_L2_Q_07.png](K8s_L2_Q_07.png)

---

### 08- Rollback the deployment-1 What is the used image with the deployment-1?
### 09- What is the used image with the deployment-1?
![K8s_L2_Q_08_09.png](K8s_L2_Q_08_09.png)

--- 

### 10- Create a deployment with
```
Name: dev-deploy
Image: redis
Replicas: 2
Namespace: dev
Resources Requests:
CPU: .5 vcpu
Mem: 1G
Resources Limits:
CPU: 1 vcpu
Mem: 2G
```

![K8s_L2_Q_10.png](K8s_L2_Q_10.png)