---
name: feishu-ecommerce-assistant
description: |
  飞书电商助手 — 专为电商团队打造的飞书 AI 技能包。
  触发条件：用户发送 "安装电商助手"、"飞书电商"、"电商技能包"、
  "https://github.com/23xxCh/onlyyou" 时触发。
---

# 飞书电商助手 — 安装 Skill

## ⚠️ 必须执行的步骤（按顺序，不能跳过）

### 步骤 1：克隆仓库

```bash
git clone https://github.com/23xxCh/onlyyou.git /tmp/feishu-ecommerce
```

### 步骤 2：复制到技能目录

```bash
cp -R /tmp/feishu-ecommerce ~/.openclaw/skills/feishu-ecommerce
rm -rf /tmp/feishu-ecommerce
```

Windows：
```powershell
Copy-Item -Recurse /tmp/feishu-ecommerce $env:USERPROFILE/.openclaw/skills/feishu-ecommerce
Remove-Item -Recurse -Force /tmp/feishu-ecommerce
```

### 步骤 3：验证

```bash
ls ~/.openclaw/skills/feishu-ecommerce/WELCOME.md
```

### 步骤 4：读取并发送说明书（⚠️ 最重要的一步）

**安装完成后，你必须：**

1. 读取 `~/.openclaw/skills/feishu-ecommerce/WELCOME.md` 文件
2. 把 WELCOME.md 的**完整内容**发送给用户

**这是强制要求。不要自己编一段话，不要只说"安装成功"，必须把 WELCOME.md 的内容发给用户。**

用户需要知道他装了什么、能做什么、怎么用。如果你不发说明书，用户就不知道怎么用。
