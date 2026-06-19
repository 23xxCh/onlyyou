#!/usr/bin/env bash
# 飞书电商助手更新脚本
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
TMP_DIR="/tmp/feishu-ecommerce-update-$$"

echo "飞书电商助手更新程序"
echo "========================"

# 克隆最新版本
echo "正在检查更新..."
rm -rf "$TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null

# 获取本地版本
LOCAL_DIR="${HOME}/.aily/skills/feishu-ecommerce"
if [ -d "$LOCAL_DIR/.git" ]; then
    cd "$LOCAL_DIR"
    LOCAL_COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
    REMOTE_COMMIT=$(cd "$TMP_DIR" && git rev-parse HEAD 2>/dev/null || echo "unknown")
    
    if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
        echo "已经是最新版本！"
        rm -rf "$TMP_DIR"
        exit 0
    fi
    
    echo "发现新版本，正在更新..."
else
    echo "正在安装..."
fi

# 执行安装脚本
bash "$TMP_DIR/install.sh"

rm -rf "$TMP_DIR"

echo ""
echo "========================"
echo "更新完成！"
echo "========================"