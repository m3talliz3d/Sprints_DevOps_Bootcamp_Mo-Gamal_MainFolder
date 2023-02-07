## 1) What is Jenkins pipeline?
#### Jenkins pipeline is a process where developers are able to implement and integrate continuous integration pipelines in Jenkins.
<br>

---
<br>

## 02) What scripting language is Jenkins pipeline syntax based on?
#### Groovy Programming Language 

<br>

---

<br>

## 03) What are the ways you can write pipeline in Jenkins?
### A Jenkinsfile can be written using two types of syntax - Declarative and Scripted.
<br>

---

<br>

## 04) Create Jenkins pipeline for your repo and use script file (jenkinsfile) to write pipeline syntax ? 

<br>

### Pipline
![](Jenkins_Lab2_Q_04_01_pipeline.png)
<br><br>

### cresentials used to access GitHub Repo
![](Jenkins_Lab2_Q_04_02_SCM-Creds&scriptFromPipeline.png)
<br><br>

### File that will used to find and build
![](Jenkins_Lab2_Q_04_03_SCM-ScriptFilePathOnGithub.png)
<br><br>

### jenkinsfile script
![](Jenkins_Lab2_Q_04_04_jenkinsfile-script.png)
<br><br>

### build performed
![](Jenkins_Lab2_Q_04_05_StageRun.png)
<br><br>

### Output-1
![](Jenkins_Lab2_Q_04_06_Output-1.png)
<br><br>

### Output-2 (cont)
![](Jenkins_Lab2_Q_04_07_Output-2.png)
<br><br>

### Output-3 (cont)
![](Jenkins_Lab2_Q_04_08_Output-3.png)

---
<br>

---
<br><br>
## 05) Create another multi-branch pipeline and filter branches to contain only (master , dev , test ) ? 
<br>

### Pipline name (mutli-branch)
![](Jenkins_Lab2_Q_05_01_pipeline.png)
<br><br>

### multi-branch config
![](Jenkins_Lab2_Q_05_02_multibranch-config.png)
<br><br>

### detect specific branches on GitHub
![](Jenkins_Lab2_Q_05_03_multibranch-detection.png)
<br><br>

### Showing detected branches
![](Jenkins_Lab2_Q_05_04_detected-branches.png)
<br><br>

### Branches available on Github
![](Jenkins_Lab2_Q_05_05_GitHub-branches.png)
<br><br>

### dev-build "build"
![](Jenkins_Lab2_Q_05_06_dev-build.png)
<br><br>

### stage-build "build"
![](Jenkins_Lab2_Q_05_07_stage-build.png)
<br><br>
### test-build "build"

![](Jenkins_Lab2_Q_05_08_test-build.png)
