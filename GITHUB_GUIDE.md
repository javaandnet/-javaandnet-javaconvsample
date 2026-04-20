# GitHub 同步使用指南

## 📦 仓库信息

- **仓库地址**: https://github.com/javaandnet/-javaandnet-javaconvsample
- **本地路径**: `/Users/fengleiren/git/aicoder/workspace/new`
- **分支**: master

---

## 🚀 快速开始

### 日常同步流程

```bash
cd /Users/fengleiren/git/aicoder/workspace/new

# 1. 查看更改
./github-sync.sh status

# 2. 同步到 GitHub（包含 pull + commit + push）
./github-sync.sh sync '添加新功能'

# 3. 查看历史
./github-sync.sh log
```

---

## 📋 命令详解

### 1. 查看状态

```bash
./github-sync.sh status
```

显示工作区状态，包括：
- 已修改的文件
- 新增的文件
- 已删除的文件

### 2. 拉取远程代码

```bash
./github-sync.sh pull
```

从 GitHub 拉取最新的代码更新。

### 3. 提交并推送

```bash
./github-sync.sh push '你的提交信息'
```

示例：
```bash
./github-sync.sh push '修复 HelloController 的 bug'
```

### 4. 完整同步（推荐）

```bash
./github-sync.sh sync '提交信息'
```

这个命令会：
1. 查看当前状态
2. 拉取远程更新（rebase 模式）
3. 提交本地更改
4. 推送到 GitHub

如果不提供提交信息，会提示输入。

### 5. 查看历史

```bash
# 查看最近 20 条记录
./github-sync.sh log
```

### 6. 查看未提交的更改

```bash
./github-sync.sh diff
```

### 7. 克隆仓库

```bash
# 克隆到指定目录
./github-sync.sh clone /path/to/new/location

# 交互式克隆
./github-sync.sh clone
```

### 8. 查看远程信息

```bash
./github-sync.sh remote
```

显示：
- 远程仓库地址
- 远程分支列表

---

## 💡 使用场景

### 场景 1：日常开发同步

```bash
# 早上开始工作
cd /Users/fengleiren/git/aicoder/workspace/new
./github-sync.sh pull

# 修改代码...

# 下班前同步
./github-sync.sh sync '今天的工作内容'
```

### 场景 2：多台电脑协作

**电脑 A**：
```bash
# 完成工作并推送
./github-sync.sh sync '完成功能 A'
```

**电脑 B**：
```bash
# 拉取最新代码
./github-sync.sh pull

# 继续工作
./github-sync.sh sync '继续开发功能 A'
```

### 场景 3：备份到 GitHub

```bash
# 查看状态
./github-sync.sh status

# 一键备份
./github-sync.sh sync '自动备份'
```

### 场景 4：在新位置克隆

```bash
# 克隆到其他目录
./github-sync.sh clone ~/backup/javaconvsample

# 或者直接使用 git clone
git clone https://github.com/javaandnet/-javaandnet-javaconvsample.git ~/backup/javaconvsample
```

---

## 🔧 高级用法

### 使用原生 Git 命令

同步脚本是对 Git 的封装，你也可以直接使用原生命令：

```bash
cd /Users/fengleiren/git/aicoder/workspace/new

# 查看状态
git status

# 添加所有更改
git add .

# 提交
git commit -m '提交信息'

# 拉取并合并
git pull origin master

# 推送
git push origin master

# 查看历史
git log --oneline --graph
```

### 处理冲突

如果拉取时出现冲突：

```bash
# 1. 查看冲突文件
git status

# 2. 手动编辑冲突文件，解决冲突标记
#    <<<<<<< HEAD
#    你的代码
#    =======
#    远程代码
#    >>>>>>> origin/master

# 3. 标记冲突已解决
git add <冲突文件>

# 4. 完成合并
git commit

# 5. 推送
git push origin master
```

### 回退到之前的版本

```bash
# 查看历史
./github-sync.sh log

# 回退到某个提交（使用 commit hash）
git reset --hard <commit-hash>

# 强制推送到 GitHub（谨慎使用！）
git push -f origin master
```

---

## 📊 当前提交历史

```
* a4f793b (HEAD -> master, origin/master) 更新 README - 添加 GitHub 仓库信息
* a5fd55b 添加 GitHub 同步管理脚本
* 4787e2b 添加 VS Code 查看和调试配置
* 29705ae 添加 Git 管理脚本
* a926eee 添加工作区说明文档
* 10ca37b 初始化 Spring MVC 模板项目
```

---

## ⚠️ 注意事项

1. **提交前请先拉取**
   ```bash
   ./github-sync.sh pull
   ```
   避免推送冲突。

2. **使用 sync 命令最安全**
   ```bash
   ./github-sync.sh sync '提交信息'
   ```
   它会自动处理拉取和推送。

3. **敏感信息不要提交**
   - 密码
   - API 密钥
   - 个人配置文件
   
   `.gitignore` 已配置忽略常见敏感文件。

4. **定期同步**
   - 每次开始工作前：pull
   - 完成工作后：sync/push

---

## 🔗 相关资源

- [GitHub 官方文档](https://docs.github.com/)
- [Git 官方文档](https://git-scm.com/doc)
- [Git 分支管理指南](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%AE%A1%E7%90%86)

---

## ❓ 常见问题

### Q: 推送失败怎么办？

A: 先拉取远程更新：
```bash
./github-sync.sh pull
./github-sync.sh sync '提交信息'
```

### Q: 如何撤销本地更改？

A: 
```bash
# 撤销所有未提交的更改
git checkout .

# 撤销某个文件
git checkout -- <文件名>
```

### Q: 如何查看某个文件的修改历史？

A:
```bash
git log --follow -- <文件名>
```

### Q: 如何比较两个提交的差异？

A:
```bash
git diff <commit1> <commit2>
```

---

## 📞 需要帮助？

如果遇到问题：
1. 查看 `git status`
2. 查看 `git log`
3. 检查网络连接
4. 访问 GitHub 仓库页面确认状态

祝你使用愉快！🎉
