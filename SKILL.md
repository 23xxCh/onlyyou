---
name: lobster-feishu-ecommerce
description: |
  飞书龙虾（电商版）— 全宇宙最会用飞书的 AI 数字员工，专为电商团队打造。
  当用户发送 "安装飞书龙虾"、"装龙虾"、"lobster-feishu"、"电商飞书助手"、
  "https://github.com/23xxCh/onlyyou" 时触发。
  一键安装 16 个技能 + 24 个飞书工作流 + 9 个电商案例 + 3 个提示词模板。
  安装完成后自动发送说明书。
---

# 🦞 飞书龙虾（电商版）— 安装 Skill

## 你是谁

你正在帮用户安装「飞书龙虾（电商版）」— 一个已经养好的电商数字员工模板。

## 安装流程（按顺序执行，不要跳步）

### 第一步：克隆仓库

```bash
git clone https://github.com/23xxCh/onlyyou.git /tmp/lobster-feishu
```

如果用户已有旧版本，先备份再覆盖：
```bash
# 检查是否已安装
if [ -d ~/.openclaw/skills/lobster-feishu ]; then
  cp -r ~/.openclaw/skills/lobster-feishu ~/.openclaw/skills/lobster-feishu-backup-$(date +%Y%m%d)
fi
```

### 第二步：复制到技能目录

```bash
cp -R /tmp/lobster-feishu ~/.openclaw/skills/lobster-feishu
rm -rf /tmp/lobster-feishu
```

Windows 用户：
```powershell
Copy-Item -Recurse /tmp/lobster-feishu $env:USERPROFILE/.openclaw/skills/lobster-feishu
Remove-Item -Recurse -Force /tmp/lobster-feishu
```

### 第三步：验证安装

检查以下文件是否存在：
- `~/.openclaw/skills/lobster-feishu/SOUL.md`
- `~/.openclaw/skills/lobster-feishu/AGENTS.md`
- `~/.openclaw/skills/lobster-feishu/skills/` (16个子目录)
- `~/.openclaw/skills/lobster-feishu/cases/` (9个案例)

### 第四步：读取说明书（必须执行！）

安装完成后，**立即读取 WELCOME.md 文件并将其内容发送给用户**。这是强制步骤，不能跳过。

```bash
cat ~/.openclaw/skills/lobster-feishu/WELCOME.md
```

然后将 WELCOME.md 的内容**完整地**用你自己的话发送给用户。用户必须知道自己能做什么、怎么用。

**不要只说“安装成功”就结束。必须把说明书发出去。**

---

## 📋 发送给用户的说明书

**🦞 飞书龙虾（电商版）安装成功！**

我是你的飞书龙虾，一个专为电商团队打造的 AI 数字员工。以下是我能帮你做的事情：

### 🚀 飞书核心能力
- **文档协作**：创建、编辑、搜索飞书文档
- **多维表格**：搭建选品看板、订单跟踪、客户CRM、数据看板
- **电子表格**：读写飞书表格，数据分析
- **日历管理**：日程安排、忙闲查询、会议室预约、大促排期
- **任务管理**：任务创建、分配、跟踪、客服工单
- **知识库**：Wiki 搭建、权限管理
- **审批流程**：采购审批、退款审批、价格审批
- **消息通知**：群聊管理、机器人消息、自动化通知

### 🛍️ 电商专属能力
- **选品管理**：多维表格搭建选品看板，自动化筛选评估
- **库存管理**：实时库存跟踪、缺货预警、补货提醒
- **订单管理**：订单状态流转、异常订单处理
- **客服管理**：工单系统、客户画像、话术库
- **活动管理**：618/双11 大促排期、任务分配、进度跟踪
- **供应商管理**：供应商档案、采购流程、对账管理

### 🎨 视觉创作
- **电商图片生成**：25 种场景模板（主图/详情页/社媒/直播间）
- **精美画板**：35 种配色方案，生成可编辑飞书白板
- **电商文案 SOP**：主图/详情页文案设计，含广告法合规审查
- **小红书笔记**：内容撰写 + 图片卡片生成

### 🌍 互联网能力（需配置）
- **竞品分析**：搜索 Twitter/小红书/YouTube/Reddit/B站
- **网页采集**：抓取竞品官网、行业资讯
- **邮件监听**：IMAP 邮件实时监控
- **YouTube 字幕**：提取视频字幕用于分析

### 🧠 记忆系统
- **Mem0**：记住你的偏好、客户画像、历史交互
- **审美记忆**：记住品牌风格，保持视觉一致性

### 📊 数据处理
- **Excel 编辑**：专业 Excel 编辑，支持财务模型
- **文档解析**：PDF/图片/Office 智能解析
- **Markdown 导出**：表格导出为 Excel

### 🔄 飞书工作流（24个）
- **CRM**：客户关系管理
- **ERP 库存**：进销存管理
- **商业顾问**：数据分析 + 决策建议
- **内容管线**：内容生产全流程
- **社媒追踪**：社交媒体监控
- **知识库管理**：文档归档 + 权限管理
- **会议管理**：会议纪要、待办提取、日程安排
- **每日简报**：自动汇总昨日工作
- **任务摘要**：任务进度自动汇报
- **审批提醒**：审批超时自动催办

### 🛠️ 工具
- **飞书 CLI**：200+ 命令，覆盖飞书全部业务域

---

### 第五步：告知配置需求

告诉用户，部分功能需要额外配置：

| 功能 | 需要配置 | 怎么配 |
|---|---|---|
| 飞书 API | 飞书应用凭证 | `lark-cli config init` |
| AI 生图 | Waninter API Key | 告诉我你的 API Key |
| 邮件监听 | IMAP 邮箱授权码 | 告诉我你的邮箱信息 |
| 互联网搜索 | Agent Reach | `pip install agent-reach` |
| 文档解析 | xparse-cli | 告诉我帮你安装 |
| 小红书 | Cookie | 浏览器登录后导出 Cookie |

**不需要配置也能用的功能**：飞书文档/表格/日历/任务的读写操作（通过 OpenClaw 飞书插件）。

---

## 注意事项

1. 安装过程中不要修改任何文件
2. 如果用户已有旧版本，保留 `MEMORY.md`（用户的记忆）
3. 安装完成后询问用户想先体验哪个功能
4. 如果 git clone 失败，检查网络连接，或提示用户手动下载 zip

## 更新流程

用户说"更新龙虾"时：
```bash
cd ~/.openclaw/skills/lobster-feishu
git pull origin main
```
