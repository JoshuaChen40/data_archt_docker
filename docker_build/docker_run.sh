#!/bin/bash

# 定義要構建的服務列表
services=(
    # "grafana" 
    # "redis" 
    # "mysql" 
    "postgres" 
    # "mongo" 
    # "kafka" 
    # "airflow" 
    # "airflow_default_worker" 
    # "dbt" 
    # "mlflow" 
    # "flask" 
    # "fastapi" 
    # "dash" 
)

# 使用迴圈構建每個服務的 Docker 圖像
for service in "${services[@]}"; do
    if docker images | grep -q $service; then
        echo "docker run: $service "
        docker run -d --name $service $service
    else
        echo "Image does not exist."
    fi
done

echo "All container have been built or attempted."

echo "If you want to login a container use: docker exec -it {container ID/name} /bin/sh"
