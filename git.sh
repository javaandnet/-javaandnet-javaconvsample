#!/bin/bash

# Workspace New Git 管理脚本

WORKSPACE_DIR="/Users/fengleiren/git/aicoder/workspace/new"

cd "$WORKSPACE_DIR"

case "$1" in
    status)
        echo "======================================"
        echo "Workspace New Git 状态"
        echo "======================================"
        git status
        ;;
    
    add)
        echo "======================================"
        echo "添加所有更改"
        echo "======================================"
        git add .
        git status
        ;;
    
    commit)
        if [ -z "$2" ]; then
            echo "错误: 请提供提交信息"
            echo "用法: $0 commit '提交信息'"
            exit 1
        fi
        echo "======================================"
        echo "提交更改"
        echo "======================================"
        git add .
        git commit -m "$2"
        echo ""
        echo "提交成功！"
        ;;
    
    log)
        echo "======================================"
        echo "提交历史"
        echo "======================================"
        git log --oneline --graph --all
        ;;
    
    diff)
        echo "======================================"
        echo "更改详情"
        echo "======================================"
        git diff --stat
        ;;
    
    clean)
        echo "======================================"
        echo "清理未跟踪的文件"
        echo "======================================"
        echo "警告: 这将删除所有未跟踪的文件"
        read -p "确认？(y/N) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git clean -fd
            echo "清理完成"
        else
            echo "已取消"
        fi
        ;;
    
    *)
        echo "======================================"
        echo "Workspace New Git 管理工具"
        echo "======================================"
        echo "用法: $0 {status|add|commit|log|diff|clean}"
        echo ""
        echo "命令说明:"
        echo "  status  - 查看 Git 状态"
        echo "  add     - 添加所有更改"
        echo "  commit  - 提交更改 (需要提供提交信息)"
        echo "  log     - 查看提交历史"
        echo "  diff    - 查看更改详情"
        echo "  clean   - 清理未跟踪的文件"
        echo ""
        echo "示例:"
        echo "  $0 status"
        echo "  $0 commit '添加新功能'"
        echo "  $0 log"
        ;;
esac
