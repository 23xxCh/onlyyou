# 🦞 飞书龙虾（电商版）

> 全宇宙最会用飞书的 AI 数字员工，专为电商团队打造

## ⚡ 一键安装

**方法一：告诉你的 AI Agent**

直接对你的 Claude Code / OpenClaw / Codex / Cursor 说：

```
帮我安装飞书龙虾：https://github.com/23xxCh/onlyyou
```

Agent 会自动克隆、安装、发送说明书。

**方法二：一键脚本**

```bash
curl -fsSL https://raw.githubusercontent.com/23xxCh/onlyyou/main/install.sh | bash
```

**方法三：手动安装**

```bash
git clone https://github.com/23xxCh/onlyyou.git
cp -R onlyyou ~/.openclaw/skills/lobster-feishu
```

**方法四：更新已有版本**

```bash
cd ~/.openclaw/skills/lobster-feishu && git pull
```

---

## 🦞 这是什么

飞书龙虾是一个**已经养好**的 AI Agent 模板。它不只是聊天机器人——它有记忆、有经验、有案例库，是一个真正的飞书+电商专家。

安装后，你的 AI Agent 就具备了：
- **16 个技能**：飞书 API / 画板 / 记忆 / Excel / 邮件 / 文档解析 / 网页采集 / AI 生图 / 电商视觉 / YouTube / 拍卖 / 互联网搜索 / 文案 SOP / 审美记忆 / 飞书工作流
- **24 个飞书工作流**：CRM / 库存 / 商业顾问 / 内容管线 / 社媒追踪 / 知识库 / 会议管理 / 每日简报 / 任务摘要 / 审批提醒…
- **9 个电商案例**：选品 / 大促 / 客服 / 库存 / 画板 / 项目管理 / 日历 / 文档 / 视觉创作
- **3 个提示词模板**：飞书新人引导 / 效率诊断 / 电商新人引导
- **飞书 CLI 工具**：200+ 命令，覆盖飞书全部业务域

---

## 🚀 安装后能做什么

### 飞书基础能力
- 🚀 **快速上手**：飞书新用户的问题一站式解答
- 💡 **隐藏技巧**：大多数人不知道的飞书高效用法
- 📊 **多维表格**：Bitable 从入门到精通
- 📅 **日程管理**：飞书日历的高级用法
- ✅ **任务管理**：飞书任务的最佳实践
- 📚 **知识库**：Wiki 的组织和权限管理
- 🎨 **精美画板**：35 种配色方案，一键生成可编辑的飞书白板

### 电商专属能力
- 🛍️ **选品管理**：多维表格搭建选品看板
- 📦 **库存管理**：实时库存跟踪、缺货预警、补货提醒
- 📋 **订单管理**：订单状态流转、异常订单处理
- 💬 **客服管理**：工单系统、客户画像、话术库
- 🎉 **活动管理**：618/双11 大促排期、任务分配、进度跟踪
- 📈 **数据看板**：销售数据、流量数据、转化率可视化
- 🏭 **供应商管理**：供应商档案、采购流程、对账管理

### 视觉创作
- 🖼️ **电商图片生成**：25 种场景模板（主图/详情页/社媒/直播间）
- ✍️ **电商文案 SOP**：主图/详情页文案设计，含广告法合规审查
- 🎨 **店铺风格拆解**：分析竞品店铺的配色、排版、设计语言
- 📕 **小红书笔记**：内容撰写 + 图片卡片生成

### 互联网能力
- 🌍 **竞品分析**：搜索 Twitter / 小红书 / YouTube / Reddit / B站
- 📺 **YouTube 字幕**：提取视频字幕用于分析
- 📧 **邮件监听**：IMAP 邮件实时监控

### 数据处理
- 📊 **Excel 编辑**：专业 Excel 编辑，支持财务模型
- 📑 **文档解析**：PDF / 图片 / Office 智能解析
- 📄 **Markdown 导出**：表格导出为 Excel

### 记忆系统
- 🧠 **Mem0**：记住你的偏好、客户画像、历史交互
- 🎨 **审美记忆**：记住品牌风格，保持视觉一致性

---

## ⚙️ 功能配置

| 功能 | 状态 | 配置方式 |
|---|---|---|
| 飞书文档/表格/日历/任务 | ✅ 开箱即用 | 通过 OpenClaw 飞书插件 |
| 飞书 CLI | ✅ 开箱即用 | `npx @larksuite/cli@latest install` |
| 精美画板 | ✅ 开箱即用 | 需要 lark-cli |
| 电商案例库 | ✅ 开箱即用 | 无需配置 |
| 提示词模板 | ✅ 开箱即用 | 无需配置 |
| AI 生图/视频 | ⚙️ 需配置 | 告诉我你的 Waninter API Key |
| 邮件监听 | ⚙️ 需配置 | 告诉我你的 IMAP 邮箱信息 |
| 互联网搜索 | ⚙️ 需配置 | `pip install agent-reach` |
| 文档解析 | ⚙️ 需配置 | 告诉我帮你安装 xparse-cli |
| 小红书 | ⚙️ 需配置 | 浏览器登录后导出 Cookie |
| YouTube 字幕 | ⚙️ 需配置 | `pip install yt-dlp` |

---

## 📦 包含什么

```
lobster-feishu/
├── SKILL.md                         # 安装指南（Agent 自动读取）
├── install.sh                       # 一键安装脚本
├── SOUL.md                          # 龙虾的灵魂（人设、性格、价值观）
├── AGENTS.md                        # 行为准则和飞书知识体系
├── MEMORY.md                        # 长期记忆（越用越值钱）
├── README.md                        # 你正在看的这个
├── cases/                           # 案例库（9个）
│   ├── 001 ~ 004                    # 飞书通用案例
│   └── 005 ~ 009                    # 电商专属案例
├── prompts/                         # 提示词模板（3个）
├── skills/                          # 技能包（16个）
│   ├── feishu-quick-reference.md
│   ├── beautiful-feishu-whiteboard/ # 35种配色画板
│   ├── mem0-skills/                 # Mem0 记忆系统
│   ├── ecom-details-image/          # 25种电商视觉模板
│   ├── ecommerce-visual-copywriting/# 电商文案SOP
│   ├── aesthetic-memory-skills/     # 电商视觉全流程
│   ├── agent-reach/                 # 13个互联网平台
│   ├── waninter-creative/           # AI图片/视频生成
│   ├── z-excel-editor/              # 专业 Excel
│   ├── z-mail-reader/               # 邮件监听
│   ├── z-smart-xparse/              # 文档解析
│   ├── z-web-pack/                  # 网页采集
│   └── lark-workflows/              # 24个飞书工作流
└── tools/lark-cli/                  # 飞书官方 CLI
```

---

## 🎯 快速体验

安装后，试试这些指令：

```
帮我搭一个选品管理看板
帮我生成这款产品的 Amazon 主图
帮我分析竞品店铺的视觉风格
帮我写一篇小红书笔记
帮我做大促排期
帮我管理库存预警
帮我做销售数据报表
帮我拆解一个飞书文档
```

---

## 🏢 商业价值

这只龙虾的价值在于它的**记忆和案例库**——这是用时间喂出来的，不是写代码写出来的。

| 版本 | 内容 | 适合 |
|---|---|---|
| 免费版 | 基础模板 + 9个案例 | 个人/小团队试用 |
| 专业版 | 行业案例库 + 定制训练 | 电商团队 |
| 企业版 | 私有部署 + 持续更新 | 品牌/大卖家 |
| SaaS 版 | 按月租用 | 所有人 |

---

## 📄 License

MIT

---

## 🙏 致谢

本项目整合了以下开源项目的能力：
- [larksuite/cli](https://github.com/larksuite/cli) — 飞书官方 CLI
- [beautiful-feishu-whiteboard](https://github.com/zarazhangrui/beautiful-feishu-whiteboard) — 飞书画板配色
- [mem0ai/mem0](https://github.com/mem0ai/mem0) — AI 记忆系统
- [Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach) — 互联网平台接入
- [liangdabiao/ecom-details-image](https://github.com/liangdabiao/ecom-details-image) — 电商视觉创作
- [feichanggege/ecommerce-visual-copywriting-skill](https://github.com/feichanggege/ecommerce-visual-copywriting-skill) — 电商文案 SOP
- [BENZEMA216/ai-ecommerce-agent-skills](https://github.com/BENZEMA216/ai-ecommerce-agent-skills) — 电商视觉全流程
- [liangdabiao/lark-workflow-feishu-cli](https://github.com/liangdabiao/lark-workflow-feishu-cli) — 飞书工作流
- [mageia/skills-hub](https://github.com/mageia/skills-hub) — 技能集合
- [tjxj/z-skills](https://github.com/tjxj/z-skills) — 工具技能
