#!/usr/bin/env bash
# 飞书电商助手一键安装脚本
# 用法：bash install.sh
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
AILY="${HOME}/.aily"
WORKSPACE="${AILY}/workspace"
SKILLS="${AILY}/skills"
TMP_DIR="/tmp/feishu-ecommerce-$$"

echo "飞书电商助手安装程序"
echo "========================"

# 克隆仓库
echo "正在下载..."
rm -rf "$TMP_DIR"
if command -v git &> /dev/null; then
    git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null
else
    echo "错误：需要安装 git"
    echo "请运行：apt install git 或 brew install git"
    exit 1
fi

# 备份旧版本
if [ -d "$SKILLS/ecom-details-image" ]; then
    echo "发现旧版本，正在备份..."
    for skill in ecom-details-image ecommerce-visual-copywriting aesthetic-memory-skills \
        agent-reach beautiful-feishu-whiteboard mem0-skills waninter-creative \
        youtube-transcript-local z-excel-editor z-mail-reader z-md-excel \
        z-smart-xparse z-web-pack christies-auctions-summary sothebys-auctions-summary \
        lark-workflows; do
        if [ -d "$SKILLS/$skill" ]; then
            cp -r "$SKILLS/$skill" "$SKILLS/${skill}-backup-$(date +%Y%m%d%H%M%S)"
        fi
    done
    echo "已备份"
fi

# 1. 把 16 个子技能分别安装到 ~/.aily/skills/
echo "正在安装技能到 ~/.aily/skills/ ..."
mkdir -p "$SKILLS"
for skill_dir in "$TMP_DIR"/skills/*/; do
    skill_name=$(basename "$skill_dir")
    target="${SKILLS}/${skill_name}"
    rm -rf "$target"
    cp -R "$skill_dir" "$target"
    echo "  已安装: $skill_name"
done

# 2. 把 lark-cli 安装到 ~/.aily/tools/
echo "正在安装工具到 ~/.aily/tools/ ..."
mkdir -p "${AILY}/tools"
rm -rf "${AILY}/tools/lark-cli"
cp -R "$TMP_DIR/tools/lark-cli" "${AILY}/tools/lark-cli"
echo "  已安装: lark-cli"

# 3. 把案例复制到工作空间
echo "正在复制案例到工作空间..."
rm -rf "${WORKSPACE}/cases"
cp -R "$TMP_DIR/cases" "${WORKSPACE}/cases"
echo "  已复制: cases/"

# 4. 把提示词模板复制到工作空间
echo "正在复制提示词模板到工作空间..."
rm -rf "${WORKSPACE}/prompts"
cp -R "$TMP_DIR/prompts" "${WORKSPACE}/prompts"
echo "  已复制: prompts/"

# 5. 把 WELCOME.md 复制到工作空间
cp "$TMP_DIR/WELCOME.md" "${WORKSPACE}/WELCOME.md"
echo "  已复制: WELCOME.md"

# 6. 把行为准则追加到工作空间 AGENTS.md
if [ -f "${WORKSPACE}/AGENTS.md" ]; then
    # 检查是否已经追加过，避免重复
    if ! grep -q "飞书电商助手" "${WORKSPACE}/AGENTS.md"; then
        echo "" >> "${WORKSPACE}/AGENTS.md"
        echo "---" >> "${WORKSPACE}/AGENTS.md"
        cat "$TMP_DIR/AGENTS.md" >> "${WORKSPACE}/AGENTS.md"
        echo "  已更新: AGENTS.md"
    else
        echo "  已存在: AGENTS.md (跳过)"
    fi
fi

rm -rf "$TMP_DIR"

echo ""
echo "========================"
echo "飞书电商助手安装成功！"
echo "========================"
echo ""
echo "已安装到："
echo "  技能:   ~/.aily/skills/ (16个)"
echo "  工具:   ~/.aily/tools/lark-cli/"
echo "  案例:   ~/.aily/workspace/cases/"
echo "  模板:   ~/.aily/workspace/prompts/"
echo ""
cat "${WORKSPACE}/WELCOME.md"