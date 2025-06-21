#!/bin/ash
set -e

SERVICE_URL="http://api-gateway:8080/actuator/health"
WAIT_INTERVAL=10

ATTEMPT=1
until curl --output /dev/null --silent --head --fail "${SERVICE_URL}"; do
  echo "Attempt ${ATTEMPT}: Service at ${SERVICE_URL} is not yet reachable."
  echo "  - Status: Connection failed or HTTP error (e.g., 4xx, 5xx)."
  echo "  - Next retry in ${WAIT_INTERVAL} seconds."
  sleep "${WAIT_INTERVAL}"
  ATTEMPT=$((ATTEMPT+1))
done

exec artillery "$@"
