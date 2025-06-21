# petclinic-microservice-loadgen-AppDagent


*** need to have docker installed on the machine you are going to use ***
Clone the repo and run following command to build docker images with AppD account details:
-------------------------------------------------------------------------------------------
docker-compose build \
  --build-arg APPDYNAMICS_AGENT_APPLICATION_NAME="App-Name" \
  --build-arg APPDYNAMICS_AGENT_ACCOUNT_NAME="Account-name" \
  --build-arg APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY="my-access-key" \
  --build-arg APPDYNAMICS_CONTROLLER_HOST_NAME="AppD_host_name" \
  --build-arg APPDYNAMICS_CONTROLLER_PORT="443" \
  --build-arg APPDYNAMICS_CONTROLLER_SSL_ENABLED="true"


