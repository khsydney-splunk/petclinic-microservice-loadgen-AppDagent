#!/bin/bash

# This script uses native RHEL tools (sed) to interactively update
# the docker-compose.yml file with AppDynamics build arguments.

COMPOSE_FILE="docker-compose.yml"

# --- Step 1: Check for the compose file ---
if [ ! -f "$COMPOSE_FILE" ]; then
    echo "Error: '$COMPOSE_FILE' not found in the current directory."
    exit 1
fi

# --- Step 2: Gather Configuration from User ---
echo "Please enter your AppDynamics configuration details:"
read -p "Enter Application Name: " APP_NAME
read -p "Enter Account Name: " ACCOUNT_NAME
read -p "Enter Account Access Key: " ACCESS_KEY
read -p "Enter Controller Host Name (e.g., my-controller.saas.appdynamics.com): " CONTROLLER_HOST
read -p "Enter Controller Port (e.g., 443): " CONTROLLER_PORT
read -p "Is Controller SSL Enabled? (true/false): " SSL_ENABLED

echo ""
echo "--- Configuration Summary ---"
echo "Application Name: $APP_NAME"
echo "Account Name:     $ACCOUNT_NAME"
echo "Access Key:       [hidden]"
echo "Controller Host:  $CONTROLLER_HOST"
echo "Controller Port:  $CONTROLLER_PORT"
echo "SSL Enabled:      $SSL_ENABLED"
echo "---------------------------"
read -p "Is this correct? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# --- Step 3: Backup and Modify the Compose File ---
echo ""
echo "Creating a backup: ${COMPOSE_FILE}.bak"
cp "$COMPOSE_FILE" "${COMPOSE_FILE}.bak"

echo "Updating '$COMPOSE_FILE' with the new configuration..."

# Use sed to find and replace the empty values.
# The '-i' flag on GNU sed (standard on RHEL) edits the file in-place.
# The '|' character is used as a delimiter to avoid issues if a value contains '/'.
sed -i \
  -e "s|APPDYNAMICS_AGENT_APPLICATION_NAME: \"\"|APPDYNAMICS_AGENT_APPLICATION_NAME: \"$APP_NAME\"|g" \
  -e "s|APPDYNAMICS_AGENT_ACCOUNT_NAME: \"\"|APPDYNAMICS_AGENT_ACCOUNT_NAME: \"$ACCOUNT_NAME\"|g" \
  -e "s|APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY: \"\"|APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY: \"$ACCESS_KEY\"|g" \
  -e "s|APPDYNAMICS_CONTROLLER_HOST_NAME: \"\"|APPDYNAMICS_CONTROLLER_HOST_NAME: \"$CONTROLLER_HOST\"|g" \
  -e "s|APPDYNAMICS_CONTROLLER_PORT: \"\"|APPDYNAMICS_CONTROLLER_PORT: \"$CONTROLLER_PORT\"|g" \
  -e "s|APPDYNAMICS_CONTROLLER_SSL_ENABLED: \"\"|APPDYNAMICS_CONTROLLER_SSL_ENABLED: \"$SSL_ENABLED\"|g" \
  "$COMPOSE_FILE"

echo ""
echo "✅ Successfully updated '$COMPOSE_FILE'."
echo "A backup of the original file is saved as '${COMPOSE_FILE}.bak'."