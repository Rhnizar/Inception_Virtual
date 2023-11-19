#!/bin/bash
sudo docker rm -f $(sudo docker ps -qa)

sudo docker rmi $(sudo docker image ls -qa)