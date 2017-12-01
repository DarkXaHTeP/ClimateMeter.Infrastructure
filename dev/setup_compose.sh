echo "Creating data volumes for Consul and SQL Server..."
docker volume create --name=climatemeter-consul-data
docker volume create --name=climatemeter-sqlserver-data

echo "Starting docker-compose..."
docker-compose up -d