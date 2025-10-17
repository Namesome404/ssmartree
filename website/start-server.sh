#!/bin/bash

# SmartTree Website Local Server
# 启动本地开发服务器

echo "🌱 启动SmartTree官方网站本地服务器..."
echo "=================================="

# 检查Python是否安装
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "❌ 错误: 未找到Python，请先安装Python"
    exit 1
fi

# 获取当前目录
WEBSITE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$WEBSITE_DIR"

echo "📁 网站目录: $WEBSITE_DIR"
echo "🐍 Python版本: $($PYTHON_CMD --version)"

# 检查端口是否被占用
PORT=8080
while lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; do
    echo "⚠️  端口 $PORT 已被占用，尝试端口 $((PORT+1))"
    PORT=$((PORT+1))
done

echo "🚀 启动服务器在端口 $PORT..."
echo "🌐 访问地址: http://localhost:$PORT"
echo "📱 移动端预览: http://$(ipconfig getifaddr en0):$PORT"
echo ""
echo "按 Ctrl+C 停止服务器"
echo "=================================="

# 启动服务器
$PYTHON_CMD -m http.server $PORT
