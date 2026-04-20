# Spring MVC Hello World 模板

这是一个基础的 Spring MVC 项目模板，用于代码转换参考。

## 项目结构

```
springmvc/
├── pom.xml                          # Maven 配置文件
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/
│       │       └── controller/
│       │           └── HelloController.java    # 控制器
│       ├── resources/                           # 资源文件目录
│       └── webapp/
│           ├── index.jsp                        # 首页
│           └── WEB-INF/
│               ├── web.xml                      # Web 应用配置
│               ├── spring-mvc-servlet.xml       # Spring MVC 配置
│               └── views/
│                   └── hello.jsp                # Hello World 视图
└── README.md                                    # 说明文档
```

## 技术栈

- **框架**: Spring MVC 5.3.20
- **Java 版本**: 1.8
- **视图技术**: JSP + JSTL
- **构建工具**: Maven
- **Servlet 版本**: 3.1

## 构建和运行

### 1. 编译项目

```bash
mvn clean compile
```

### 2. 打包 WAR 文件

```bash
mvn clean package
```

生成的 WAR 文件位于: `target/springmvc-template.war`

### 3. 部署到 Tomcat

将 WAR 文件复制到 Tomcat 的 `webapps` 目录：

```bash
cp target/springmvc-template.war $CATALINA_HOME/webapps/
```

启动 Tomcat：

```bash
$CATALINA_HOME/bin/startup.sh
```

### 4. 访问应用

打开浏览器访问：

- 首页: http://localhost:8080/springmvc-template/
- Hello World: http://localhost:8080/springmvc-template/hello

## 使用说明

这个模板项目展示了 Spring MVC 的基本配置：

1. **DispatcherServlet 配置**: 在 `web.xml` 中配置前端控制器
2. **组件扫描**: 自动扫描 `com.example` 包下的控制器
3. **注解驱动**: 使用 `@Controller`、`@GetMapping` 等注解
4. **视图解析**: 配置 JSP 视图解析器
5. **字符编码**: 配置 UTF-8 字符编码过滤器

## 转换参考

从 Struts 转换到 Spring MVC 时，注意以下对应关系：

| Struts | Spring MVC |
|--------|-----------|
| struts-config.xml | spring-mvc-servlet.xml |
| Action | @Controller |
| ActionForm | @ModelAttribute / @RequestParam |
| ActionForward | String (视图名称) |
| ActionMapping | Model |

## 注意事项

- 确保使用 Tomcat 9 或更高版本
- Java 版本需要 1.8 或以上
- Maven 版本建议 3.6 或以上
