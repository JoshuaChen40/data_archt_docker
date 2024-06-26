#!/bin/bash

# 設定基本路徑
TOOL_HOME=/usr/data_archt/

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
    "dbt" 
    "mlflow" 
    # "flask" 
    # "fastapi" 
    # "dash" 
)

# 使用迴圈構建每個服務的 Docker 圖像
for service in "${services[@]}"; do
    service_path="$TOOL_HOME/$service/image"
    
    # 檢查目錄是否存在
    if [ -d "$service_path" ]; then
        echo "Building $service image..."
        cd "$service_path"
        docker build -t $service .
    else
        echo "Directory does not exist: $service_path"
    fi
done

echo "All images have been built or attempted."
