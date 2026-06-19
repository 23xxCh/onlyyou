---
name: feishu-ecommerce-assistant
description: |
  飞书电商助手 — 专为电商团队打造的飞书 AI 技能包。
  用户说 "帮我安装" + Gitee/GitHub 链接时触发。
  执行 install.sh 完成安装后，读取 WELCOME.md 发给用户。
---

# 飞书电商助手安装流程

## 当用户说"帮我安装"时

### 第 1 步：下载仓库

```bash
git clone https://gitee.com/cxx450/onlyyou.git /tmp/feishu-ecommerce
if [ ! -d /tmp/feishu-ecommerce ]; then
  echo "下载失败，请检查网络连接"
  exit 1
fi
```

### 第 2 步：执行安装脚本

```bash
bash /tmp/feishu-ecommerce/install.sh
```

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

```bash
cd ~/.aily/skills/feishu-ecommerce && git pull && cd ..
for d in aesthetic-memory-skills agent-reach beautiful-feishu-whiteboard \
  christies-auctions-summary ecom-details-image ecommerce-visual-copywriting \
  mem0-skills sothebys-auctions-summary waninter-creative youtube-transcript-local \
  z-excel-editor z-mail-reader z-md-excel z-smart-xparse z-web-pack; do
  if [ -d "$d/.git" ]; then
    cd "$d" && git pull && cd ..
  fi
done
```

如果子技能没有 .git 目录（不是单独的仓库），则从主仓库重新拷贝：
```bash
git clone https://gitee.com/cxx450/onlyyou.git /tmp/update-feishu
cp -R /tmp/update-feishu/skills/* ~/.aily/skills/
rm -rf /tmp/update-feishu
```