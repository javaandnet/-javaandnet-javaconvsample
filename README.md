# Workspace New - 转换目标项目

本目录用于存放代码转换后的目标项目。

## 目录结构

```
new/
├── .gitignore           # Git 忽略配置
├── README.md            # 本文件
└── java/
    └── springmvc/       # Spring MVC 模板项目
```

## Git 管理

本目录有独立的 Git 仓库，用于跟踪转换后项目的版本。

### 常用命令

```bash
# 查看状态
cd /Users/fengleiren/git/aicoder/workspace/new
git status

# 添加更改
git add .

# 提交更改
git commit -m "描述你的更改"

# 查看历史
git log --oneline
```

### 忽略规则

已配置忽略以下文件：
- 构建产物：`target/`, `*.war`, `*.class`, `*.jar`
- IDE 配置：`.idea/`, `*.iml`, `.vscode/`
- 系统文件：`.DS_Store`, `Thumbs.db`
- 日志文件：`*.log`

## 模板项目

### Spring MVC 模板

位置：`java/springmvc/`

这是一个 Spring MVC Hello World 模板项目，用于：
- 作为 Struts 转 Spring MVC 的参考模板
- 快速初始化新的 Spring MVC 项目
- 学习 Spring MVC 基本配置

**启动方法**：
```bash
cd java/springmvc
./start.sh
```

**访问地址**：
- 首页：http://localhost:8080/springmvc-template/
- Hello World：http://localhost:8080/springmvc-template/hello

## 使用说明

1. 从 `workspace/old` 复制需要转换的旧项目
2. 使用 aicoder 工具进行代码转换
3. 转换结果保存在本目录
4. 使用 Git 跟踪转换进度和版本

## 相关目录

- `../old` - 待转换的旧项目
- `../aicoder` - aicoder 主项目
