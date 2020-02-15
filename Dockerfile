FROM satoshegen/alpine-java8:8u202_jdk
RUN apk add curl
ADD target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar

HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java -jar spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar" ]

