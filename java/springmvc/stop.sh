#!/bin/bash

# Spring MVC 模板项目停止脚本

TOMCAT_HOME="/opt/homebrew/opt/tomcat@9"

echo "======================================"
echo "停止 Tomcat 服务器"
echo "======================================"

# 检查 Tomcat 是否运行
if curl -s http://localhost:8080/ > /dev/null 2>&1; then
    echo "正在停止 Tomcat..."
    $TOMCAT_HOME/bin/catalina stop
    
    sleep 3
    
    # 确认是否停止
    if curl -s http://localhost:8080/ > /dev/null 2>&1; then
        echo "警告: Tomcat 可能仍在运行"
        echo "强制停止: kill -9 \$(ps aux | grep tomcat | grep -v grep | awk '{print \$2}')"
    else
        echo "✓ Tomcat 已停止"
    fi
else
    echo "Tomcat 未在运行"
fi

echo "======================================"
