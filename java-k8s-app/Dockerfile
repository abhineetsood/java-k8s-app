FROM openjdk:11-jre-slim
VOLUME /tmp
COPY target/java-k8s-app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]