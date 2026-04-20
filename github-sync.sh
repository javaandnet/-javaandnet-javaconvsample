#!/bin/bash

# GitHub 同步管理脚本

WORKSPACE_DIR="/Users/fengleiren/git/aicoder/workspace/new"
REPO_URL="https://github.com/javaandnet/-javaandnet-javaconvsample.git"

cd "$WORKSPACE_DIR"

case "$1" in
    status)
        echo "======================================"
        echo "Git 状态"
        echo "======================================"
        git status
        ;;
    
    pull)
        echo "======================================"
        echo "从 GitHub 拉取最新代码"
        echo "======================================"
        git pull origin master
        ;;
    
    push)
        if [ -z "$2" ]; then
            echo "错误: 请提供提交信息"
            echo "用法: $0 push '提交信息'"
            exit 1
        fi
        echo "======================================"
        echo "提交并推送到 GitHub"
        echo "======================================"
        git add .
        git commit -m "$2"
        git push origin master
        echo ""
        echo "✓ 已成功推送到 GitHub"
        ;;
    
    sync)
        echo "======================================"
        echo "同步到 GitHub"
        echo "======================================"
        echo "[1/3] 查看状态..."
        git status --short
        echo ""
        
        echo "[2/3] 拉取远程更新..."
        git pull origin master --rebase
        echo ""
        
        echo "[3/3] 推送到远程..."
        git add .
        git status --short
        echo ""
        
        # 检查是否有更改
        if [ -n "$(git status --porcelain)" ]; then
            if [ -z "$2" ]; then
                echo "请输入提交信息:"
                read COMMIT_MSG
            else
                COMMIT_MSG="$2"
            fi
            
            git commit -m "$COMMIT_MSG"
            git push origin master
            echo ""
            echo "✓ 同步完成"
        else
            echo "✓ 没有更改，已是最新"
        fi
        ;;
    
    log)
        echo "======================================"
        echo "提交历史"
        echo "======================================"
        git log --oneline --graph --all -20
        ;;
    
    diff)
        echo "======================================"
        echo "未提交的更改"
        echo "======================================"
        git diff --stat
        ;;
    
    clone)
        echo "======================================"
        echo "克隆仓库到新位置"
        echo "======================================"
        if [ -z "$2" ]; then
            echo "请指定目标目录:"
            read TARGET_DIR
        else
            TARGET_DIR="$2"
        fi
        
        echo "克隆到: $TARGET_DIR"
        git clone "$REPO_URL" "$TARGET_DIR"
        echo ""
        echo "✓ 克隆完成"
        ;;
    
    remote)
        echo "======================================"
        echo "远程仓库信息"
        echo "======================================"
        echo "远程地址:"
        git remote -v
        echo ""
        echo "远程分支:"
        git branch -r
        ;;
    
    *)
        echo "======================================"
        echo "GitHub 同步管理工具"
        echo "======================================"
        echo "仓库: $REPO_URL"
        echo ""
        echo "用法: $0 {status|pull|push|sync|log|diff|clone|remote}"
        echo ""
        echo "命令说明:"
        echo "  status  - 查看 Git 状态"
        echo "  pull    - 从 GitHub 拉取代码"
        echo "  push    - 提交并推送到 GitHub"
        echo "  sync    - 完整同步（pull + commit + push）"
        echo "  log     - 查看提交历史"
        echo "  diff    - 查看未提交的更改"
        echo "  clone   - 克隆仓库到新位置"
        echo "  remote  - 查看远程仓库信息"
        echo ""
        echo "示例:"
        echo "  $0 status"
        echo "  $0 push '添加新功能'"
        echo "  $0 sync '更新代码'"
        echo "  $0 clone /path/to/new/location"
        ;;
esac
