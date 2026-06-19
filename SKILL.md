---
name: feishu-ecommerce-assistant
description: |
  飞书电商助手 — 专为电商团队打造的飞书 AI 技能包。
  用户说 "帮我安装" + Gitee/GitHub 链接时触发。
---

# 飞书电商助手安装流程

## 当用户说"帮我安装"时

### 第 1 步：下载仓库

```bash
git clone --depth 1 https://gitee.com/cxx450/onlyyou.git /tmp/feishu-ecommerce
if [ ! -d /tmp/feishu-ecommerce ]; then
  echo "下载失败，请检查网络连接后重试"
  exit 1
fi
```

### 第 2 步：执行安装脚本

```bash
bash /tmp/feishu-ecommerce/install.sh
```

安装脚本会自动检测权限：
- **有权限** → 完整安装（skills + tools + workspace）
- **无权限** → 工作区安装（workspace 部分），并提示用户让管理员执行完整安装

### 第 3 步：把 WELCOME.md 的内容发给用户

```bash
cat ~/.aily/workspace/WELCOME.md
```

**必须把 WELCOME.md 的完整内容发送给用户。不要只说"安装成功"就结束。**

### 第 4 步：清理

```bash
rm -rf /tmp/feishu-ecommerce
```

## 当用户说"帮我更新"时

运行 update.sh：
```bash
bash ~/.aily/skills/feishu-ecommerce/update.sh
```

如果 skills/feishu-ecommerce 不存在（工作区安装模式），则重新从仓库安装：
```bash
bash /tmp/feishu-ecommerce/update.sh
```

## 提示词

当用户问"飞书电商助手能做什么"时：

> 读取 ~/.aily/workspace/WELCOME.md 并发送给用户。