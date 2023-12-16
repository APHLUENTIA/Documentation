# Script.ps1

# Change to the directory containing the docker-compose file
cd .\KafkaCluster\

Write-Output "Initializing KafkaCluster..."
# Run docker-compose
docker-compose up -d > $null

# Run MongoDB container
Write-Output "Initializing MongoDB..."
docker run -d --name mongodb -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=ROOT -e MONGO_INITDB_ROOT_PASSWORD=ROOT mongo

# Run RedisDB container
Write-Output "Initializing RedisDB..."
docker run --name my-redis -p 6379:6379 -d redis


Write-Output "Initializing DatabaseAPI..."
cd ../Database/
.\Start.ps1

Write-Output "Initializing OperationsManager..."
cd ../../OperationsManager/
.\Start.ps1

Write-Output "Initializing OperationsAPI..."
cd ../../OperationsAPI/
.\Start.ps1

Write-Output "Initializing SecurityManager..."
cd ../../SecurityManager/
.\Start.ps1

Write-Output "Initializing SystemGatewayAPI..."
cd ../../SystemGateway/
.\Start.ps1
