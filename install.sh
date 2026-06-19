#!/usr/bin/env bash
# 飞书电商助手一键安装脚本
set -e

REPO_URL="https://github.com/23xxCh/onlyyou.git"
SKILL_DIR="${HOME}/.openclaw/skills/feishu-ecommerce"
TMP_DIR="/tmp/feishu-ecommerce-$$"

echo "📦 飞书电商助手安装程序"
echo "========================"

# 备份旧版本
if [ -d "$SKILL_DIR" ]; then
    echo "发现旧版本，正在备份..."
    BACKUP_DIR="${SKILL_DIR}-backup-$(date +%Y%m%d%H%M%S)"
    cp -r "$SKILL_DIR" "$BACKUP_DIR"
    echo "✅ 已备份到: $BACKUP_DIR"
fi

# 克隆仓库
echo "正在下载..."
rm -rf "$TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null

# 复制到技能目录
echo "正在安装..."
mkdir -p "$(dirname "$SKILL_DIR")"
rm -rf "$SKILL_DIR"
cp -R "$TMP_DIR" "$SKILL_DIR"
rm -rf "$TMP_DIR"

# 验证
if [ -f "$SKILL_DIR/AGENTS.md" ]; then
    echo ""
    echo "========================"
    echo "✅ 飞书电商助手安装成功！"
    echo "========================"
    echo ""
    echo "📁 位置: $SKILL_DIR"
    echo ""
    # 输出 WELCOME.md 内容
    if [ -f "$SKILL_DIR/WELCOME.md" ]; then
        cat "$WELCOME.md"
    fi
else
    echo "❌ 安装失败，请检查网络连接"
    exit 1
fi
