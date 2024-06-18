#!/bin/bash

# 網路名稱
NETWORK_NAME="airflow-tier"

# 檢查網路是否存在
if docker network ls | grep -qw $NETWORK_NAME; then
    echo "Network $NETWORK_NAME exists. Removing..."
    docker network rm $NETWORK_NAME
fi

# 創建網路
echo "Creating network $NETWORK_NAME..."
docker network create $NETWORK_NAME

# 設定基本路徑
TOOL_HOME=/usr/data_archt/docker/docker_compose/

# 定義要構建的服務列表
services=(
    # "grafana" 
    # "redis" 
    # "mysql" 
    "postgres" 
    # "mongo" 
    # "kafka" 
    # "airflow" 
    "dbt" 
    # "mlflow" 
    # "flask" 
    # "fastapi" 
    # "dash" 
)

# 使用迴圈構建每個服務的 Docker 圖像

for service in "${services[@]}"; do
    service_path="$TOOL_HOME/$service"
    
    # 檢查目錄是否存在
    if [ -d "$service_path" ]; then
        echo "docker-compose up $service ..."
        cd "$service_path"
        docker-compose up -d
    else
        echo "Directory does not exist: $service_path"
    fi
done

echo "All images have been compose up or attempted."
