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

# 安装到 ~/.aily/skills/feishu-ecommerce/
echo "正在安装技能..."
mkdir -p "$SKILL_DIR"
rm -rf "$SKILL_DIR"
cp -R "$TMP_DIR" "$SKILL_DIR"

# 将行为准则追加到工作空间 AGENTS.md
if [ -f "$WORKSPACE/AGENTS.md" ]; then
    echo "" >> "$WORKSPACE/AGENTS.md"
    echo "---" >> "$WORKSPACE/AGENTS.md"
    echo "## 飞书电商助手" >> "$WORKSPACE/AGENTS.md"
    echo "" >> "$WORKSPACE/AGENTS.md"
    echo "已安装飞书电商助手，详见 ~/.aily/skills/feishu-ecommerce/AGENTS.md" >> "$WORKSPACE/AGENTS.md"
fi

rm -rf "$TMP_DIR"

echo ""
echo "========================"
echo "飞书电商助手安装成功！"
echo "========================"
echo ""
echo "技能位置: ~/.aily/skills/feishu-ecommerce/"
echo "行为准则: ~/.aily/skills/feishu-ecommerce/AGENTS.md"
echo ""
cat "$SKILL_DIR/WELCOME.md"