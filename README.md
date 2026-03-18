# 算力网络平台

基于 Docker 容器化部署的算力网络管理平台。

## 快速启动

```bash
./start.sh
```

访问: http://localhost:8082

## 停止服务

```bash
./stop.sh
```

## 架构说明

- **主平台** (8082): system-vue - 系统入口，通过 iframe 嵌入其他模块
- **后端服务** (8090): Spring Boot API
- **资源编排** (8000): ithings - 资源编排与调度模块
- **协同计算** (8001): ymir - 泛在协同计算模块
- **流量预测** (9528): easyts - 智能流量预测模块

## 常用命令

```bash
# 查看服务状态
docker compose ps

# 查看日志
docker compose logs -f [服务名]

# 重启服务
docker compose restart [服务名]
```

## 注意事项

- 首次启动需要 3-5 分钟安装依赖
- 确保端口 8000, 8001, 8082, 8090, 9528 未被占用
- 使用 Docker 容器隔离环境，避免版本冲突
