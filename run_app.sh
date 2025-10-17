#!/bin/bash

echo "🌱 智能绿植应用启动脚本"
echo "=========================="

# 检查Flutter环境
echo "检查Flutter环境..."
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter未安装，请先安装Flutter SDK"
    exit 1
fi

echo "✅ Flutter环境检查通过"

# 获取依赖
echo "获取项目依赖..."
flutter pub get

# 分析代码
echo "分析代码质量..."
flutter analyze --no-fatal-infos

echo ""
echo "🚀 启动选项："
echo "1. Web版本 (推荐用于演示)"
echo "2. Android版本"
echo "3. iOS版本 (仅macOS)"
echo "4. 桌面版本"
echo ""

read -p "请选择运行平台 (1-4): " choice

case $choice in
    1)
        echo "启动Web版本..."
        flutter run -d chrome --web-renderer html
        ;;
    2)
        echo "启动Android版本..."
        flutter run -d android
        ;;
    3)
        echo "启动iOS版本..."
        flutter run -d ios
        ;;
    4)
        echo "启动桌面版本..."
        flutter run -d macos
        ;;
    *)
        echo "无效选择，启动Web版本..."
        flutter run -d chrome --web-renderer html
        ;;
esac
