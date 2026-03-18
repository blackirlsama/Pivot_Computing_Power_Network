#!/bin/bash
docker compose down 2>/dev/null
pkill -f "node.*800[012]" 2>/dev/null
pkill -f "node.*9528" 2>/dev/null
pkill -f "java.*8090" 2>/dev/null
echo "✅ 服务已停止"
