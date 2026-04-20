# VS Code 查看和调试 Spring MVC 项目指南

## 📖 目录

1. [打开项目](#打开项目)
2. [安装必需扩展](#安装必需扩展)
3. [查看 Java 代码](#查看-java-代码)
4. [使用 Maven 任务](#使用-maven-任务)
5. [调试配置](#调试配置)
6. [常用操作](#常用操作)

---

## 打开项目

### 方式一：打开工作区（推荐）

在 VS Code 中打开工作区文件：

```bash
code /Users/fengleiren/git/aicoder/workspace/new/new.code-workspace
```

或者在 VS Code 中：
1. `File` → `Open Workspace from File...`
2. 选择 `/Users/fengleiren/git/aicoder/workspace/new/new.code-workspace`

### 方式二：直接打开项目文件夹

```bash
code /Users/fengleiren/git/aicoder/workspace/new/java/springmvc
```

---

## 安装必需扩展

打开 VS Code 后，会提示安装推荐的 Java 扩展包。如果未自动提示，请手动安装：

### 推荐扩展

1. **Extension Pack for Java** (必装)
   - ID: `vscjava.vscode-java-pack`
   - 包含：语言支持、调试器、测试运行器、Maven 支持等

2. **Maven for Java**
   - ID: `vscjava.vscode-maven`
   - 提供 Maven 项目管理

3. **Debugger for Java**
   - ID: `vscjava.vscode-java-debug`
   - Java 调试支持

### 安装方法

1. 点击左侧活动栏的扩展图标（或 `Cmd+Shift+X`）
2. 搜索扩展名称
3. 点击 `Install`

---

## 查看 Java 代码

### 项目结构

打开项目后，你可以在资源管理器中看到：

```
springmvc/
├── pom.xml                    # Maven 配置（可点击跳转依赖）
├── src/main/java/
│   └── com/example/controller/
│       └── HelloController.java    # 👈 控制器代码
└── src/main/webapp/
    └── WEB-INF/
        ├── web.xml                 # Web 配置
        └── spring-mvc-servlet.xml  # Spring MVC 配置
```

### 代码导航功能

安装 Java 扩展后，你可以使用：

- **跳转到定义**: `F12` 或 `Cmd+点击` 类名/方法名
- **查找引用**: `Shift+F12`
- **代码大纲**: `Cmd+Shift+O` 快速导航到类/方法
- **符号搜索**: `Cmd+T` 搜索任意符号
- **Go to File**: `Cmd+P` 快速打开文件

### 查看类图

1. 在 Java 文件上右键
2. 选择 `Show Type Hierarchy` (`Shift+Alt+H`)
3. 查看类的继承关系

---

## 使用 Maven 任务

### 方式一：使用 VS Code 任务

1. 按 `Cmd+Shift+P`
2. 输入 `Tasks: Run Task`
3. 选择以下任务之一：

| 任务名称 | 说明 |
|---------|------|
| `Maven Clean` | 清理构建产物 |
| `Maven Compile` | 编译项目 |
| `Maven Package` | 打包 WAR 文件 |
| `Deploy to Tomcat` | 部署到 Tomcat |
| `Build and Deploy` | 构建并部署 |
| `Start Tomcat` | 启动 Tomcat |
| `Stop Tomcat` | 停止 Tomcat |
| `View Tomcat Logs` | 查看 Tomcat 日志 |

### 方式二：使用 Maven 侧边栏

1. 点击左侧活动栏的 `MAVEN` 图标
2. 展开 `springmvc-template` 项目
3. 双击执行生命周期命令：
   - `clean`
   - `compile`
   - `package`
   - `install`

### 方式三：使用终端

```bash
cd /Users/fengleiren/git/aicoder/workspace/new/java/springmvc

# 编译
mvn compile

# 打包
mvn clean package

# 构建并部署
./start.sh
```

---

## 调试配置

### 远程调试 Tomcat

#### 1. 启动 Tomcat 调试模式

```bash
# 停止现有 Tomcat
/opt/homebrew/opt/tomcat@9/bin/catalina stop

# 以调试模式启动
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket
/opt/homebrew/opt/tomcat@9/bin/catalina jpda start
```

#### 2. 启动 VS Code 调试器

1. 按 `F5` 或点击调试图标
2. 选择 `Debug Spring MVC (Attach)`
3. 调试器将连接到 Tomcat

#### 3. 设置断点

- 在代码行号左侧点击设置断点
- 推荐在 `HelloController.java` 的 `hello()` 方法中设置断点
- 访问 http://localhost:8080/springmvc-template/hello 触发断点

### 调试配置文件

调试配置位于 `.vscode/launch.json`：

```json
{
    "type": "java",
    "name": "Debug Spring MVC (Attach)",
    "request": "attach",
    "hostName": "localhost",
    "port": 8000,
    "projectName": "springmvc-template"
}
```

---

## 常用操作

### 查看 Spring MVC 配置

#### 1. web.xml
- 位置：`src/main/webapp/WEB-INF/web.xml`
- 内容：DispatcherServlet 配置、过滤器配置

#### 2. spring-mvc-servlet.xml
- 位置：`src/main/webapp/WEB-INF/spring-mvc-servlet.xml`
- 内容：组件扫描、视图解析器、注解驱动

#### 3. HelloController.java
- 位置：`src/main/java/com/example/controller/HelloController.java`
- 内容：控制器逻辑

### 修改代码并重新部署

1. 修改 `HelloController.java`
2. 保存文件（`Cmd+S`）
3. 运行任务：`Cmd+Shift+P` → `Tasks: Run Task` → `Build and Deploy`
4. Tomcat 会自动重新部署

### 查看实时日志

```bash
# 方式一：使用 VS Code 任务
Tasks: Run Task → View Tomcat Logs

# 方式二：使用终端
tail -f /opt/homebrew/opt/tomcat@9/libexec/logs/catalina.out
```

### 快速启动脚本

```bash
cd /Users/fengleiren/git/aicoder/workspace/new/java/springmvc

# 一键启动
./start.sh

# 停止
./stop.sh
```

---

## 💡 提示和技巧

### 1. 代码自动补全

- 输入代码时会自动弹出建议
- 按 `Tab` 或 `Enter` 接受建议
- 按 `Cmd+Space` 手动触发

### 2. 快速修复

- 当代码有错误时，会出现黄色波浪线
- 将光标放在错误上，按 `Cmd+.` 查看快速修复建议

### 3. 重命名符号

- 将光标放在变量/方法名上
- 按 `F2`
- 输入新名称，所有引用会自动更新

### 4. 格式化代码

- 按 `Shift+Alt+F` 格式化当前文件
- 保存时会自动格式化（已配置）

### 5. 查看 Javadoc

- 将鼠标悬停在类名或方法名上
- 会自动显示文档

---

## 🔧 故障排除

### Java 扩展未激活

1. 确保已安装 JDK（`java -version`）
2. 重启 VS Code
3. 检查输出面板：`View` → `Output` → 选择 `Language Support for Java`

### Maven 项目未识别

1. 打开命令面板：`Cmd+Shift+P`
2. 输入 `Java: Clean Java Language Server Workspace`
3. 重启 VS Code

### 无法连接到 Tomcat

1. 确认 Tomcat 正在运行：`curl http://localhost:8080`
2. 确认调试端口：`lsof -i :8000`
3. 以 JPDA 模式重启 Tomcat

---

## 📚 学习资源

- [Spring MVC 官方文档](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html)
- [VS Code Java 文档](https://code.visualstudio.com/docs/languages/java)
- [Maven 官方文档](https://maven.apache.org/guides/)

---

## 📞 需要帮助？

如果遇到问题：
1. 查看 VS Code 输出面板
2. 检查 Tomcat 日志
3. 查看项目 README.md

祝调试愉快！🎉
