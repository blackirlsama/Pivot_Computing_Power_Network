#!/bin/bash
echo "🚀 启动算力网络平台..."
./stop.sh
docker compose up -d
echo ""
echo "✅ 服务已启动（首次启动需要 3-5 分钟安装依赖）"
echo ""
echo "访问地址: http://localhost:8082"
echo "查看日志: docker compose logs -f"
echo "检查状态: docker compose ps"
