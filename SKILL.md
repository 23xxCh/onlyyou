---
name: feishu-ecommerce-assistant
description: |
  飞书电商助手 — 专为电商团队打造的飞书 AI 技能包。
  用户说 "帮我安装" + Gitee/GitHub 链接时触发。
  适配 Aily / OpenClaw / Workboddy 等平台。
---

# 飞书电商助手安装流程

## 当用户说"帮我安装"时

### 第 1 步：下载仓库

```bash
git clone --depth 1 https://gitee.com/cxx450/onlyyou.git /tmp/feishu-ecommerce
if [ ! -d /tmp/feishu-ecommerce ]; then
  下载失败，检查网络
  exit 1
fi
```

### 第 2 步：执行安装脚本

```bash
bash /tmp/feishu-ecommerce/install.sh
```

`install.sh` 会自动检测平台（Aily / OpenClaw / Workboddy 等）并安装到对应目录。

- **有权限** → 完整安装（skills + tools + workspace 全部到齐）
- **无权限**（如 Aily 的 skills/ 是系统目录）→ 只装 workspace，提示让管理员执行完整安装

### 第 3 步：把 WELCOME.md 发给用户

```bash
cat ~/.aily/workspace/WELCOME.md 2>/dev/null || cat ~/.openclaw/workspace-agent/WELCOME.md 2>/dev/null || cat ~/.workboddy/workspace/WELCOME.md
```

**必须把 WELCOME.md 的完整内容发送给用户。不要只说"安装成功"就结束。**

### 第 4 步：清理

```bash
rm -rf /tmp/feishu-ecommerce
```

## 当用户说"帮我更新"时

重新拉取并安装：

```bash
git clone --depth 1 https://gitee.com/cxx450/onlyyou.git /tmp/feishu-ecommerce
bash /tmp/feishu-ecommerce/install.sh
rm -rf /tmp/feishu-ecommerce
```

## 提示词

当用户问"飞书电商助手能做什么"时：

> 读取 WELCOME.md 并发送给用户。