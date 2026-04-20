#!/bin/bash

# Spring MVC 模板项目启动脚本

PROJECT_DIR="/Users/fengleiren/git/aicoder/workspace/new/java/springmvc"
TOMCAT_HOME="/opt/homebrew/opt/tomcat@9/libexec"
WAR_FILE="$PROJECT_DIR/target/springmvc-template.war"
APP_NAME="springmvc-template"

echo "======================================"
echo "Spring MVC Hello World 启动脚本"
echo "======================================"

# 1. 编译和打包
echo ""
echo "[1/3] 编译和打包项目..."
cd "$PROJECT_DIR"
mvn clean package -q

if [ $? -eq 0 ]; then
    echo "✓ 打包成功"
else
    echo "✗ 打包失败"
    exit 1
fi

# 2. 部署到 Tomcat
echo ""
echo "[2/3] 部署到 Tomcat..."
cp "$WAR_FILE" "$TOMCAT_HOME/webapps/"

if [ $? -eq 0 ]; then
    echo "✓ 部署成功"
else
    echo "✗ 部署失败"
    exit 1
fi

# 3. 启动 Tomcat（如果未运行）
echo ""
echo "[3/3] 检查 Tomcat 状态..."

# 检查 Tomcat 是否已经在运行
if curl -s http://localhost:8080/ > /dev/null 2>&1; then
    echo "✓ Tomcat 已经在运行"
    echo "  重新部署应用..."
    # 通过 touch web.xml 触发重新部署
    touch "$TOMCAT_HOME/webapps/$APP_NAME/WEB-INF/web.xml" 2>/dev/null
else
    echo "  启动 Tomcat..."
    /opt/homebrew/opt/tomcat@9/bin/catalina start
    sleep 3
fi

# 等待应用部署
echo ""
echo "等待应用部署..."
sleep 3

# 测试应用
echo ""
echo "======================================"
echo "测试应用..."
echo "======================================"

if curl -s http://localhost:8080/$APP_NAME/hello > /dev/null 2>&1; then
    echo "✓ 应用启动成功！"
    echo ""
    echo "访问地址："
    echo "  首页: http://localhost:8080/$APP_NAME/"
    echo "  Hello World: http://localhost:8080/$APP_NAME/hello"
    echo ""
    echo "查看日志: tail -f $TOMCAT_HOME/logs/catalina.out"
else
    echo "✗ 应用启动失败，请检查日志"
    echo "  查看日志: tail -f $TOMCAT_HOME/logs/catalina.out"
    exit 1
fi

echo "======================================"
