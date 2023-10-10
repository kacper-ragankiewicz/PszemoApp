#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# ANSI color codes
RED="\e[31m"
GREEN="\e[32m"
NC="\e[0m"
BLUE="\e[34m"

# Remove volumes and containers
docker-compose down || true  # Ignore errors if there are no containers to remove
# docker rmi mongodb || true
# docker rmi postgres || true
# docker volume rm chiptreeapi_mongodb-data || true
# docker volume rm chiptreeapi_postgres-data || true
sudo rm -rf docker

# Start services and wait until they are ready
docker-compose up -d --build

# Function to wait for logs and display errors
wait_for_logs() {
    service_name="$1"
    keyword="$2"
    echo -e "${BLUE}Waiting for $service_name to be ready...${NC}"
    
    # Loop while waiting for logs
    while true; do
        logs_output=$(docker logs "$service_name")
        
        if echo "$logs_output" | grep -q "ERROR"; then
            echo -e " "
            echo -e "${RED}[ERROR]${NC} Error detected in $service_name logs:"
            echo "$logs_output"
            exit 1
        fi
        if echo "$logs_output" | grep -q "TypeError"; then
            echo -e " "
            echo -e "${RED}[ERROR]${NC} Error detected in $service_name logs:"
            echo "$logs_output"
            exit 1
        fi
        
        if echo "$logs_output" | grep -q "$keyword"; then
            echo -e "${GREEN}$service_name is ready.${NC}"
            return
        fi
        
        sleep 5
    done
}

# Wait for MongoDB and PostgreSQL logs
wait_for_logs "postgres-pszemoapp" "database system is ready to accept connections"


echo -e "${GREEN}All services are ready.${NC}"
