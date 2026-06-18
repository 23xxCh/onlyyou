#!/usr/bin/env bash
# 🦞 飞书龙虾（电商版）一键安装脚本
# 用法：bash install.sh

set -e

REPO_URL="https://github.com/23xxCh/onlyyou.git"
SKILL_DIR="${HOME}/.openclaw/skills/lobster-feishu"
TMP_DIR="/tmp/lobster-feishu-$$"

echo "🦞 飞书龙虾（电商版）安装程序"
echo "================================"

# 备份旧版本
if [ -d "$SKILL_DIR" ]; then
    echo "📦 发现旧版本，正在备份..."
    BACKUP_DIR="${SKILL_DIR}-backup-$(date +%Y%m%d%H%M%S)"
    cp -r "$SKILL_DIR" "$BACKUP_DIR"
    echo "✅ 已备份到: $BACKUP_DIR"
fi

# 克隆仓库
echo "📥 正在下载飞书龙虾..."
rm -rf "$TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null

# 复制到技能目录
echo "📂 正在安装..."
mkdir -p "$(dirname "$SKILL_DIR")"
rm -rf "$SKILL_DIR"
cp -R "$TMP_DIR" "$SKILL_DIR"
rm -rf "$TMP_DIR"

# 验证安装
echo "🔍 正在验证安装..."
ERRORS=0
for f in SOUL.md AGENTS.md MEMORY.md README.md SKILL.md; do
    if [ ! -f "$SKILL_DIR/$f" ]; then
        echo "❌ 缺少文件: $f"
        ERRORS=$((ERRORS + 1))
    fi
done

if [ $ERRORS -eq 0 ]; then
    echo ""
    echo "================================"
    echo "🦞 飞书龙虾（电商版）安装成功！"
    echo "================================"
    echo ""
    echo "📁 安装位置: $SKILL_DIR"
    echo ""
    echo "📋 已安装内容："
    echo "  • 16 个技能（飞书/电商/AI生成/互联网搜索）"
    echo "  • 24 个飞书工作流（CRM/库存/会议/知识库...）"
    echo "  • 9 个电商案例（选品/大促/客服/库存...）"
    echo "  • 3 个提示词模板（新人引导/效率诊断/电商引导）"
    echo "  • 飞书 CLI 工具（200+ 命令）"
    echo ""
    echo "🚀 现在你可以问我："
    echo "  • \"帮我搭一个选品管理看板\""
    echo "  • \"帮我生成电商主图\""
    echo "  • \"帮我分析竞品店铺风格\""
    echo "  • \"帮我写小红书笔记\""
    echo "  • \"帮我管理库存预警\""
    echo "  • \"帮我做大促排期\""
    echo ""
else
    echo "❌ 安装可能不完整，请检查错误信息"
    exit 1
fi
