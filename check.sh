#!/bin/bash

echo "🔍 检查服务启动状态..."
echo ""

# 检查容器状态
echo "📦 容器状态:"
docker compose ps --format "table {{.Name}}\t{{.Status}}"
echo ""

# 检查后端
echo "🔧 后端服务:"
if docker exec pivot_backend ps aux 2>/dev/null | grep -q "spring-boot:run"; then
    echo "  ✅ Spring Boot 正在运行"
    if curl -s http://localhost:8090 >/dev/null 2>&1; then
        echo "  ✅ 端口 8090 可访问"
    else
        echo "  ⏳ 端口 8090 启动中..."
    fi
else
    echo "  ⏳ 正在启动..."
fi
echo ""

# 检查前端
echo "🌐 前端服务:"

check_frontend() {
    local name=$1
    local container=$2
    local port=$3

    if docker exec $container ps aux 2>/dev/null | grep -q "npm"; then
        if docker exec $container ps aux 2>/dev/null | grep -q "node.*serve\|node.*dev\|node.*start"; then
            echo "  ✅ $name - 开发服务器运行中"
        else
            echo "  ⏳ $name - 正在安装依赖..."
        fi
    else
        echo "  ❌ $name - 未运行"
    fi
}

check_frontend "主平台 (8082)" "pivot_system_vue" "8082"
check_frontend "资源编排 (8000)" "pivot_ithings" "8000"
check_frontend "协同计算 (8001)" "pivot_ymir" "8001"
check_frontend "流量预测 (9528)" "pivot_easyts" "9528"

echo ""
echo "💡 提示:"
echo "  - 首次启动需要 3-5 分钟"
echo "  - 查看日志: docker compose logs -f [服务名]"
echo "  - 访问地址: http://localhost:8082"
