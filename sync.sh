#!/bin/bash

git status
sleep 2
git add .
git commit -am change_$(date  "+%Y-%m-%d_%H:%M:%S") 
git push origin main
