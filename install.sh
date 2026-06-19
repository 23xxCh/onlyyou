#!/usr/bin/env bash
# 飞书电商助手安装脚本
# 
# 跨平台适配：自动检测 Aily / OpenClaw / Workboddy 等目录结构
# 用法：bash install.sh
#       或 PLATFORM=aily bash install.sh（强制指定平台）
set -e

REPO_URL="https://gitee.com/cxx450/onlyyou.git"
TMP_DIR="/tmp/feishu-ecommerce-$$"

echo "飞书电商助手安装程序"
echo "========================"
echo ""

# ─────────────────────────────────────
# 平台检测
# ─────────────────────────────────────
detect_platform() {
    if [ -d "$HOME/.aily" ]; then
        echo "aily"
    elif [ -d "$HOME/.openclaw" ]; then
        echo "openclaw"
    elif [ -d "$HOME/.openclaw" ]; then
        # macOS/CLI 版 OpenClaw
        echo "openclaw"
    elif [ -d "$HOME/.workboddy" ]; then
        echo "workboddy"
    else
        echo "unknown"
    fi
}

PLATFORM="${PLATFORM:-$(detect_platform)}"

echo "检测到平台: $PLATFORM"

# ─────────────────────────────────────
# 按平台设置路径
# ─────────────────────────────────────
case "$PLATFORM" in
    aily)
        SKILLS_DIR="$HOME/.aily/skills"
        WORKSPACE="$HOME/.aily/workspace"
        TOOLS_DIR="$HOME/.aily/tools"
        IS_SYSTEM_SKILLS=true   # skills/ 可能 root 权限
        ;;
    openclaw)
        SKILLS_DIR="$HOME/.openclaw/skills"
        WORKSPACE="$HOME/.openclaw/workspace-agent"
        TOOLS_DIR="$HOME/.openclaw/tools"
        IS_SYSTEM_SKILLS=false
        ;;
    workboddy)
        SKILLS_DIR="$HOME/.workboddy/skills"
        WORKSPACE="$HOME/.workboddy/workspace"
        TOOLS_DIR="$HOME/.workboddy/tools"
        IS_SYSTEM_SKILLS=false
        ;;
    *)
        # 未知平台，安装到当前用户目录
        SKILLS_DIR="$HOME/.feishu-ecommerce/skills"
        WORKSPACE="$HOME/.feishu-ecommerce"
        TOOLS_DIR="$HOME/.feishu-ecommerce/tools"
        IS_SYSTEM_SKILLS=false
        echo "⚠️  未知平台，将安装到: ~/.feishu-ecommerce/"
        echo "   建议设置 PLATFORM=xxx 环境变量指定平台"
        echo ""
        ;;
esac

# ─────────────────────────────────────
# 下载
# ─────────────────────────────────────
echo "正在下载..."
rm -rf "$TMP_DIR"
if command -v git &> /dev/null; then
    git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>/dev/null
    echo "  ✅ 下载完成"
else
    echo "错误：需要安装 git"
    exit 1
fi

# ─────────────────────────────────────
# 检测技能目录权限
# ─────────────────────────────────────
FULL_MODE=false
if mkdir -p "$SKILLS_DIR" 2>/dev/null && touch "$SKILLS_DIR/.write-test" 2>/dev/null; then
    rm -f "$SKILLS_DIR/.write-test"
    FULL_MODE=true
fi

# ─────────────────────────────────────
# 工作区安装（所有模式都执行）
# ─────────────────────────────────────
echo ""
echo "安装工作区文件..."

# 案例
mkdir -p "${WORKSPACE}/cases"
cp -R "$TMP_DIR/cases" "${WORKSPACE}/cases"
echo "  ✅ ${WORKSPACE}/cases/"

# 提示词
mkdir -p "${WORKSPACE}/prompts"
cp -R "$TMP_DIR/prompts" "${WORKSPACE}/prompts"
echo "  ✅ ${WORKSPACE}/prompts/"

# WELCOME.md
mkdir -p "$WORKSPACE"
cp "$TMP_DIR/WELCOME.md" "${WORKSPACE}/WELCOME.md"
echo "  ✅ ${WORKSPACE}/WELCOME.md"

# AGENTS.md（追加，避免重复）
if [ -f "${WORKSPACE}/AGENTS.md" ]; then
    if ! grep -q "飞书电商助手" "${WORKSPACE}/AGENTS.md" 2>/dev/null; then
        echo "" >> "${WORKSPACE}/AGENTS.md"
        echo "---" >> "${WORKSPACE}/AGENTS.md"
        cat "$TMP_DIR/AGENTS.md" >> "${WORKSPACE}/AGENTS.md"
        echo "  ✅ ${WORKSPACE}/AGENTS.md（已追加）"
    else
        echo "  ℹ️  AGENTS.md 已存在，跳过追加"
    fi
else
    cp "$TMP_DIR/AGENTS.md" "${WORKSPACE}/AGENTS.md"
    echo "  ✅ ${WORKSPACE}/AGENTS.md（已创建）"
fi

# ─────────────────────────────────────
# 完整安装（有权限时）
# ─────────────────────────────────────
if [ "$FULL_MODE" = true ]; then
    echo ""
    echo "安装技能到 $SKILLS_DIR ..."
    for skill_dir in "$TMP_DIR"/skills/*/; do
        skill_name=$(basename "$skill_dir")
        target="${SKILLS_DIR}/${skill_name}"
        rm -rf "$target"
        cp -R "$skill_dir" "$target"
        echo "  ✅ $skill_name"
    done

    echo ""
    echo "安装工具到 $TOOLS_DIR ..."
    mkdir -p "$TOOLS_DIR"
    rm -rf "${TOOLS_DIR}/lark-cli"
    cp -R "$TMP_DIR/tools/lark-cli" "${TOOLS_DIR}/lark-cli"
    echo "  ✅ ${TOOLS_DIR}/lark-cli/"
else
    echo ""
    echo "⚠️  ${SKILLS_DIR} 无写入权限，跳过技能安装。"
    echo ""
    echo "请联系管理员执行完整安装："
    echo ""
    echo "  sudo bash $(dirname "$0")/install.sh"
    echo "  # 或单独执行以下命令："
    echo "  git clone --depth 1 ${REPO_URL} /tmp/onlyyou"
    echo "  sudo bash /tmp/onlyyou/install.sh"
    echo ""
fi

rm -rf "$TMP_DIR"

# ─────────────────────────────────────
# 完成
# ─────────────────────────────────────
echo ""
echo "========================"
echo "✅ 安装完成"
echo "========================"
echo ""
echo "平台: $PLATFORM"

if [ "$FULL_MODE" = true ]; then
    echo "模式: 完整安装"
else
    echo "模式: 仅工作区（技能需管理员安装）"
fi

echo ""
echo "已安装位置："
echo "  案例:     ${WORKSPACE}/cases/"
echo "  提示词:   ${WORKSPACE}/prompts/"
echo "  说明书:   ${WORKSPACE}/WELCOME.md"

if [ "$FULL_MODE" = true ]; then
    echo "  技能:     ${SKILLS_DIR}/ (16个)"
    echo "  工具:     ${TOOLS_DIR}/lark-cli/"
fi

echo ""
cat "${WORKSPACE}/WELCOME.md"