# 🚀 快速开始 - 在 VS Code 中查看 Spring MVC 项目

## 一分钟快速上手

### 1️⃣ 打开项目

在终端中运行：

```bash
code /Users/fengleiren/git/aicoder/workspace/new/new.code-workspace
```

### 2️⃣ 安装 Java 扩展

VS Code 打开后，右下角会提示安装推荐的扩展，点击 `Install` 即可。

如果未提示，按 `Cmd+Shift+X`，搜索并安装：
- **Extension Pack for Java** (vscjava.vscode-java-pack)

### 3️⃣ 查看代码

在左侧资源管理器中，展开：
```
java/springmvc/src/main/java/com/example/controller/
    └── HelloController.java  ← 双击打开
```

### 4️⃣ 编译项目

按 `Cmd+Shift+P`，输入：
```
Tasks: Run Task → Maven Compile
```

或使用 Maven 侧边栏直接点击 `compile`。

### 5️⃣ 运行和访问

在终端中运行：
```bash
cd /Users/fengleiren/git/aicoder/workspace/new/java/springmvc
./start.sh
```

然后在浏览器中访问：
- http://localhost:8080/springmvc-template/hello

---

## 📖 详细文档

完整的使用指南请查看：[VSCODE_GUIDE.md](VSCODE_GUIDE.md)

---

## ⚡ 常用快捷键

| 快捷键 | 功能 |
|--------|------|
| `Cmd+P` | 快速打开文件 |
| `Cmd+Shift+P` | 命令面板 |
| `F12` | 跳转到定义 |
| `Shift+F12` | 查找所有引用 |
| `Cmd+Shift+O` | 跳转到符号 |
| `Cmd+T` | 搜索符号 |
| `F5` | 启动调试 |
| `F9` | 切换断点 |
| `F10` | 单步执行 |
| `F11` | 进入方法 |

---

## 🎯 核心文件位置

| 文件 | 路径 | 说明 |
|------|------|------|
| 控制器 | `java/springmvc/src/main/java/com/example/controller/HelloController.java` | 业务逻辑 |
| Spring 配置 | `java/springmvc/src/main/webapp/WEB-INF/spring-mvc-servlet.xml` | 框架配置 |
| Web 配置 | `java/springmvc/src/main/webapp/WEB-INF/web.xml` | 应用配置 |
| 视图 | `java/springmvc/src/main/webapp/WEB-INF/views/hello.jsp` | 页面模板 |
| Maven 配置 | `java/springmvc/pom.xml` | 依赖管理 |

---

## 💡 提示

- ✅ 保存文件时会自动格式化代码
- ✅ 导入语句会自动整理
- ✅ 代码错误会实时显示
- ✅ 悬停可查看文档

祝你使用愉快！🎉
