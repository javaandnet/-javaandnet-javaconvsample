<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spring MVC - Hello World</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #4CAF50;
            text-align: center;
        }
        .message {
            font-size: 24px;
            text-align: center;
            margin: 30px 0;
            color: #333;
        }
        .timestamp {
            text-align: center;
            color: #666;
            font-size: 14px;
        }
        .info {
            margin-top: 30px;
            padding: 15px;
            background-color: #e7f3fe;
            border-left: 4px solid #2196F3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Spring MVC Hello World</h1>
        
        <div class="message">
            ${message}
        </div>
        
        <div class="timestamp">
            访问时间: ${timestamp}
        </div>
        
        <div class="info">
            <h3>项目信息</h3>
            <p>这是一个 Spring MVC 模板项目，用于代码转换参考。</p>
            <ul>
                <li>框架: Spring MVC 5.3.20</li>
                <li>Java 版本: 1.8</li>
                <li>视图技术: JSP + JSTL</li>
                <li>构建工具: Maven</li>
            </ul>
        </div>
    </div>
</body>
</html>
