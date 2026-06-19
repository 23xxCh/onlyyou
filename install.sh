#!/usr/bin/env bash
# 飞书电商助手一键安装脚本
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
AILY_WORKSPACE="${HOME}/.aily/workspace"
SKILL_DIR="${AILY_WORKSPACE}/skills/feishu-ecommerce"
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

# 复制 skills 到 Aily 技能目录
echo "正在安装技能..."
mkdir -p "$SKILL_DIR"
rm -rf "$SKILL_DIR"
cp -R "$TMP_DIR/skills" "$SKILL_DIR"
cp -R "$TMP_DIR/tools" "${AILY_WORKSPACE}/tools"
cp -R "$TMP_DIR/cases" "${AILY_WORKSPACE}/cases"
cp -R "$TMP_DIR/prompts" "${AILY_WORKSPACE}/prompts"

# 复制 WELCOME.md 和 MEMORY.md 到工作区
cp "$TMP_DIR/WELCOME.md" "$AILY_WORKSPACE/"
cp "$TMP_DIR/MEMORY.md" "$AILY_WORKSPACE/"

# 将 AGENTS.md 内容追加到 Aily 的 AGENTS.md
if [ -f "$AILY_WORKSPACE/AGENTS.md" ]; then
    echo "" >> "$AILY_WORKSPACE/AGENTS.md"
    echo "---" >> "$AILY_WORKSPACE/AGENTS.md"
    echo "" >> "$AILY_WORKSPACE/AGENTS.md"
    cat "$TMP_DIR/AGENTS.md" >> "$AILY_WORKSPACE/AGENTS.md"
else
    cp "$TMP_DIR/AGENTS.md" "$AILY_WORKSPACE/"
fi

rm -rf "$TMP_DIR"

# 验证
if [ -d "$SKILL_DIR" ] && [ -f "$AILY_WORKSPACE/WELCOME.md" ]; then
    echo ""
    echo "========================"
    echo "飞书电商助手安装成功！"
    echo "========================"
    echo ""
    echo "技能位置: $SKILL_DIR"
    echo "工作区: $AILY_WORKSPACE"
    echo ""
    cat "$AILY_WORKSPACE/WELCOME.md"
else
    echo "安装失败，请检查网络连接"
    exit 1
fi
