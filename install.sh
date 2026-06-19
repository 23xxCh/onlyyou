#!/usr/bin/env bash
# 飞书电商助手一键安装脚本
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
SKILL_DIR="${HOME}/.aily/skills/feishu-ecommerce"
WORKSPACE="${HOME}/.aily/workspace"
TMP_DIR="/tmp/feishu-ecommerce-$$"

echo "飞书电商助手安装程序"
echo "========================"

# 备份旧版本
if [ -d "$SKILL_DIR" ]; then
    echo "发现旧版本，正在备份..."
    cp -r "$SKILL_DIR" "${SKILL_DIR}-backup-$(date +%Y%m%d%H%M%S)"
    echo "已备份"
fi

# 克隆仓库
echo "正在下载..."
rm -rf "$TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null

# 复制整个项目到 Aily 技能目录
echo "正在安装技能..."
mkdir -p "$SKILL_DIR"
rm -rf "$SKILL_DIR"
cp -R "$TMP_DIR" "$SKILL_DIR"

# 将 AGENTS.md 内容追加到工作空间的 AGENTS.md
if [ -f "$WORKSPACE/AGENTS.md" ]; then
    echo "" >> "$WORKSPACE/AGENTS.md"
    echo "---" >> "$WORKSPACE/AGENTS.md"
    echo "" >> "$WORKSPACE/AGENTS.md"
    cat "$TMP_DIR/AGENTS.md" >> "$WORKSPACE/AGENTS.md"
fi

rm -rf "$TMP_DIR"

# 验证
if [ -f "$SKILL_DIR/AGENTS.md" ]; then
    echo ""
    echo "========================"
    echo "飞书电商助手安装成功！"
    echo "========================"
    echo ""
    echo "技能位置: $SKILL_DIR"
    echo ""
    cat "$SKILL_DIR/WELCOME.md"
fi