## 01) What is Jenkins used for?
#### Jenkins is an open source CI/CD automation software, used to implement pipelines that automate the workflow; by detecting defects in code base, build the siftware, automate build test and deliver code base for deployment.
---

## 02) What is Jenkins agent? What is Jenkins executor (Build Executor)?
#### Jenkins Agent is is a worker node that executes your code (all steps included in a Jenkins job).

#### Example of Agents: Python, Maven, Gradle, and a lot more.

---

## 03) Explain Jenkins master-slave architecture?
#### Jenkins Master: Is the main Jenkins server is the brain, which contain all system configurations, plugins, credentials, Jobs & piplelines.

#### Jenkins Slave: Is the worker node is the muscle, that is used by the Master to execute code in created jobs.

---

## 04) Install jenkins with docker image.

![](Jenkins_Lab1_Q_04.png)

---
---

## 05) Create free style project and link it to private git repo containing any dockerfile then biuld an image from this dockerfile and push it to private docker repo
<br>

#### Project Name

![](Jenkins_Lab1_Q_05_01_Freestyle-project.png)

<br>

#### Github credentials

![](Jenkins_Lab1_Q_05_02_github-credentials.png)

<br>

#### docker hub credentials


![](Jenkins_Lab1_Q_05_03_dockerhub-credentials.png)

<br>

#### Configuring github creds for github

<br>

![](Jenkins_Lab1_Q_05_04_pipeline-gihut-credentials.png)

#### Configuring github creds for dockerhub

![](Jenkins_Lab1_Q_05_05_pipeline-dockerhub-variables.png)

<br>

#### Repo imported from swelam repo



![](Jenkins_Lab1_Q_05_06_github_repo.png)

<br>

#### Private dockerhub repo (empty)


![](Jenkins_Lab1_Q_05_07_dockerhub_repo.png)

<br>

#### jenkins excuteshell commands used for build.


![](Jenkins_Lab1_Q_05_08_jenkins-executeshell.png)

<br>

#### Console output of pull


![](Jenkins_Lab1_Q_05_09_jenkins-output-1.png)

<br>

#### Console output of push and success build on jenkins.



![](Jenkins_Lab1_Q_05_10_jenkins-output-2-success.png)

<br>

#### First image pushed to DockerHub repo


![](Jenkins_Lab1_Q_05_11_dockerhub-image1.png)

<br>

#### Second verdion of first image pushed to DockerHub repo


![](Jenkins_Lab1_Q_05_12_dockerhub-image2-v2.png)