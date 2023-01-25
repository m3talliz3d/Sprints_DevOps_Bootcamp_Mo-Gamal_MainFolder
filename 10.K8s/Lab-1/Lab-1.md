
### 01- Create a pod with the name “imperative-nginx” and with the image nginx and latest tag. using Imperative command (not yaml).
![](Q_01.jpg)

---

### 02- Create a pod with the name webserver and with the image “nginx123”Use a pod-definition YAML file.
### 03- What is the nginx pod status?
![](Q_02_03.jpg)

---

### 04- Change the nginx pod image to “nginx” check the status again
![](Q_04.jpg)

---

### 06- What does READY column in the output of get pods command indicate?
#### <font style="color: yellow"> The `Ready` indicates the readiness of containers in each pod, since some pods start faster than other </font>

---

### 05- How many pods are running in the system? Type the command to show this
### 07- Delete first pod named imperative-nginx you just created. Type the command to do this
![](Q_05_07.jpg)

---

### 08- Which node is pod named webserver running on (list two commands to do this)
![](Q_08.jpg)

---

### 09- Get a shell to the running container i.e ssh into it (figure out the command)
### 10- Run cat /etc/os-release inside the container
### 11- Exit from the shell (/bin/bash) session
![](Q_09_10_11.jpg)

---

### 12- Get logs of pod, what are logs and what they are used for?
![](Q_12.jpg)

---

### 13- How many ReplicaSets exist on the system?
#### <font style="color: yellow"> None </font>
---

### 14- create a ReplicaSet withname= replica-set-1 image= busybox replicas= 3
![](Q_14.jpg)

---

### 15- Scale the ReplicaSet replica-set-1 to 5 PODs.
![](Q_15.jpg)

---

### 16- How many PODs are READY in the replica-set-1?
### 17- Delete any one of the 5 PODs then check How many PODs exist now? Why are there still 5 PODs, even after you deleted one?
![](Q_16_17.jpg)
