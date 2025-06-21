# Use the existing image as the base
FROM --platform=linux/arm64 khsydney/spring-petclinic-vets-service:latest
WORKDIR /application
COPY ./appagent /opt/appdynamics/
EXPOSE 8081
# COPY newrelic.jar /opt/newrelic/newrelic.jar
ENV APPDYNAMICS_AGENT_APPLICATION_NAME=Nick-Petclinic-Microservice
ENV APPDYNAMICS_AGENT_TIER_NAME=spring-petclinic-vets-service
ENV APPDYNAMICS_AGENT_NODE_NAME=spring-petclinic-vets-service-container
ENV APPDYNAMICS_AGENT_ACCOUNT_NAME=se-lab
ENV APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=hj6a4d7h2cuq
ENV APPDYNAMICS_CONTROLLER_HOST_NAME=se-lab.saas.appdynamics.com
ENV APPDYNAMICS_CONTROLLER_PORT=443
ENV APPDYNAMICS_CONTROLLER_SSL_ENABLED=true

# ENTRYPOINT ["java","-jar","/app.jar"]
ENTRYPOINT ["java","-javaagent:/opt/appdynamics/javaagent.jar", "-Dappdynamics.agent.logs.dir=/app/logs/","org.springframework.boot.loader.launch.JarLauncher"]