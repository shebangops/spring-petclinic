#!/bin/bash

# Created by Vladimir Radmanovic

repo="spring-petclinic"
branch="dev"
container_name="petclinic_grid"
image_name="petclinic:0.0.1"

# Check if git is installed
if [[ -z  $(command -v git) ]]
then
   echo "Please install git to continue."
   exit 1
else
   echo "Git installed, cloning project.."
fi

# Clone project
git clone https://github.com/shebangops/${repo}.git
cd ${repo}

# Checkout branch
git checkout ${branch}

# Pull latest changes
git pull origin ${branch}

# build new jar
./mvnw package

# Check if containr is running
if [[ `docker ps -a | grep ${container_name}` = *[!\ ]* ]]
       then
         echo "Stoping and deleting docker container... "
         docker stop ${container_name}
         docker rm ${container_name}
         echo "Docker container deleted"
       else
	 echo "Container not running"
fi

# Build new image
docker build -t ${image_name} .

# Run container
docker run --name ${container_name} -itd -p 8080:8080 ${image_name}

echo "Open http://localhost:8080"
