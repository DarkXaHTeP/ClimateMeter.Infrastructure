#!/bin/bash

echo "Reading device info..."
source ../config/device_info.sh
echo "Device name is: ${DEVICE_DeviceName}"

echo "Creating data volume for Consul and Portainer..."
docker volume create --name=climatemeter-consul-data
docker volume create --name=climatemeter-portainer-data

echo "Starting docker-compose..."
docker-compose up -d