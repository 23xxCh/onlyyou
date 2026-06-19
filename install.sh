#!/usr/bin/env bash
# 飞书电商助手安装脚本
# 
# 双模式：
#   完整安装（有权限）→ ~/.aily/skills/ + ~/.aily/tools/ + ~/.aily/workspace/
#   工作区安装（无权限）→ ~/.aily/workspace/ 只安装文案部分
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
AILY="${HOME}/.aily"
WORKSPACE="${AILY}/workspace"
SKILLS="${AILY}/skills"
TMP_DIR="/tmp/feishu-ecommerce-$$"

echo "飞书电商助手安装程序"
echo "========================"
echo ""

# 克隆仓库
echo "正在下载..."
rm -rf "$TMP_DIR"
if command -v git &> /dev/null; then
    git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null
else
    echo "错误：需要安装 git"
    exit 1
fi

# 检测权限模式
FULL_MODE=false
if mkdir -p "$SKILLS" 2>/dev/null && touch "$SKILLS/.write-test" 2>/dev/null; then
    rm -f "$SKILLS/.write-test"
    FULL_MODE=true
fi

# ─────────────────────────────────────
# 工作区安装（两种模式都执行）
# ─────────────────────────────────────
echo ""
echo "1/3  安装工作区文件..."

# 案例
mkdir -p "${WORKSPACE}/cases"
cp -R "$TMP_DIR/cases" "${WORKSPACE}/cases"
echo "  ✅ ~/.aily/workspace/cases/"

# 提示词
mkdir -p "${WORKSPACE}/prompts"
cp -R "$TMP_DIR/prompts" "${WORKSPACE}/prompts"
echo "  ✅ ~/.aily/workspace/prompts/"

# WELCOME.md
cp "$TMP_DIR/WELCOME.md" "${WORKSPACE}/WELCOME.md"
echo "  ✅ ~/.aily/workspace/WELCOME.md"

# AGENTS.md（追加，避免重复）
if [ -f "${WORKSPACE}/AGENTS.md" ]; then
    if ! grep -q "飞书电商助手" "${WORKSPACE}/AGENTS.md" 2>/dev/null; then
        echo "" >> "${WORKSPACE}/AGENTS.md"
        echo "---" >> "${WORKSPACE}/AGENTS.md"
        cat "$TMP_DIR/AGENTS.md" >> "${WORKSPACE}/AGENTS.md"
    fi
else
    cp "$TMP_DIR/AGENTS.md" "${WORKSPACE}/AGENTS.md"
fi
echo "  ✅ ~/.aily/workspace/AGENTS.md（已追加）"

# ─────────────────────────────────────
# 完整安装（需要权限）
# ─────────────────────────────────────
if [ "$FULL_MODE" = true ]; then
    echo ""
    echo "2/3  安装技能到 ~/.aily/skills/ ..."
    for skill_dir in "$TMP_DIR"/skills/*/; do
        skill_name=$(basename "$skill_dir")
        target="${SKILLS}/${skill_name}"
        rm -rf "$target"
        cp -R "$skill_dir" "$target"
        echo "  ✅ $skill_name"
    done

    echo ""
    echo "3/3  安装工具到 ~/.aily/tools/ ..."
    mkdir -p "${AILY}/tools"
    rm -rf "${AILY}/tools/lark-cli"
    cp -R "$TMP_DIR/tools/lark-cli" "${AILY}/tools/lark-cli"
    echo "  ✅ ~/.aily/tools/lark-cli/"
else
    echo ""
    echo "⚠️  ~/.aily/skills/ 无写入权限，跳过技能安装。"
    echo "⚠️  ~/.aily/tools/ 无写入权限，跳过工具安装。"
fi

rm -rf "$TMP_DIR"

# ─────────────────────────────────────
# 安装完成
# ─────────────────────────────────────
echo ""
echo "========================"
echo "✅ 安装完成！"
echo "========================"
echo ""

if [ "$FULL_MODE" = true ]; then
    echo "已安装："
    echo "  • 16 个技能  → ~/.aily/skills/"
    echo "  • lark-cli   → ~/.aily/tools/"
    echo "  • 9 个案例   → ~/.aily/workspace/cases/"
    echo "  • 3 个提示词 → ~/.aily/workspace/prompts/"
    echo "  • 行为准则   → ~/.aily/workspace/AGENTS.md"
    echo "  • 说明书     → ~/.aily/workspace/WELCOME.md"
else
    echo "已安装（工作区部分）："
    echo "  ✅ 9 个案例   → ~/.aily/workspace/cases/"
    echo "  ✅ 3 个提示词 → ~/.aily/workspace/prompts/"
    echo "  ✅ 行为准则   → ~/.aily/workspace/AGENTS.md"
    echo "  ✅ 说明书     → ~/.aily/workspace/WELCOME.md"
    echo ""
    echo "⚠️ 技能和工具需要管理员权限才能安装。"
    echo ""
    echo "在终端上执行以下命令即可完成完整安装："
    echo ""
    echo "  git clone --depth 1 $REPO_URL /tmp/onlyyou"
    echo "  sudo bash /tmp/onlyyou/install.sh"
    echo ""
fi

echo ""
# 显示 WELCOME.md
cat "${WORKSPACE}/WELCOME.md"