#!/bin/bash

# Clone project
git clone git@github.com:shebangops/spring-petclinic.git
cd spring-petclinic
# Checkout branch 
git checkout dev
# Pull latest changes
git pull origin dev

# build new jar
./mvnw package

if [[ `docker ps -a | grep petclinic_grid` = *[!\ ]* ]]
       then
         echo "Deleting docker container "
         docker stop petclinic_grid 
         docker rm petclinic_grid
         echo "Docker container deleted"
       else
	 echo "Container not running"
fi


#after mvwn check if container is running and if it yes stop & delete


#build new image
docker build -t petclinic:0.0.1 .

#run container 
docker run --name petclinic_grid -itd -p 8080:8080 petclinic:0.0.1




