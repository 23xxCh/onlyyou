# 🦞 飞书龙虾（电商版）

> 全宇宙最会用飞书的 AI 数字员工，专为电商团队打造

## 这是什么

飞书龙虾是一个**已经养好**的 AI Agent 模板，专门解决电商团队在飞书使用中的各种问题。

它不只是一个聊天机器人——它有记忆、有经验、有案例库，是一个真正的飞书+电商专家。

## 能帮你做什么

### 飞书基础能力
- 🚀 **快速上手**：飞书新用户的问题一站式解答
- 💡 **隐藏技巧**：大多数人不知道的飞书高效用法
- 🔧 **工作流搭建**：帮你用飞书搭建完整的工作流程
- 📊 **多维表格**：Bitable 从入门到精通
- 📅 **日程管理**：飞书日历的高级用法
- ✅ **任务管理**：飞书任务的最佳实践
- 📚 **知识库**：Wiki 的组织和权限管理
- 🤖 **机器人/自动化**：飞书机器人和自动化流程
- 🎨 **精美画板**：35 种配色方案，一键生成可编辑的飞书白板

### 电商专属能力
- 🛍️ **选品管理**：多维表格搭建选品看板
- 📦 **库存管理**：实时库存跟踪、预警通知
- 📋 **订单管理**：订单状态流转、异常处理
- 💬 **客服管理**：工单系统、客户画像、话术库
- 🎉 **活动管理**：大促排期、任务分配、进度跟踪
- 📈 **数据看板**：销售数据、流量数据、转化率可视化
- 🏭 **供应商管理**：供应商档案、采购流程、对账管理

### 记忆能力
- 🧠 **Mem0 记忆系统**：记住每个用户/客户的偏好和历史

### 工具能力
- 🔧 **lark-cli**：飞书官方 CLI，200+ 命令，批量操作和脚本场景
- 📊 **z-excel-editor**：专业 Excel 编辑，支持财务模型
- 📧 **z-mail-reader**：邮件读取与实时监听
- 📄 **z-md-excel**：Markdown 表格导出 Excel
- 📑 **z-smart-xparse**：智能文档解析（PDF/图片/Office）
- 🌐 **z-web-pack**：网页素材包采集
- 🎨 **waninter-creative**：AI图片/视频生成
- 📺 **youtube-transcript-local**：YouTube字幕提取
- 💎 **christies-auctions-summary**：佳士得拍卖摘要
- 🏛️ **sothebys-auctions-summary**：苏富比拍卖摘要
- 🖼️ **ecom-details-image**：电商视觉创作（25种场景模板 + Campaign Style Lock）
- 🌍 **Agent Reach**：一键接入 13 个互联网平台（Twitter/Reddit/YouTube/小红书/B站/GitHub…）
- ✍️ **ecommerce-visual-copywriting**：电商主图/详情页文案 SOP（含合规审查）
- 🎨 **aesthetic-memory-skills**：电商视觉创作全流程（审美记忆+美工助手+店铺拆解+小红书笔记）

## 包含什么

```
lobster-feishu/
├── SOUL.md                          # 龙虾的灵魂（人设、性格、价值观）
├── AGENTS.md                        # 行为准则和飞书知识体系
├── MEMORY.md                        # 长期记忆（知识库，越用越值钱）
├── README.md                        # 你正在看的这个
├── cases/                           # 案例库（8个）
│   ├── 001-bitable-从零搭建项目管理.md
│   ├── 002-日历-高效会议管理.md
│   ├── 003-文档-团队知识库搭建.md
│   ├── 004-画板-创建精美的飞书白板.md
│   ├── 005-选品-多维表格选品管理.md
│   ├── 006-活动-电商大促管理.md
│   ├── 007-客服-工单管理系统.md
│   └── 008-库存-库存管理预警.md
├── prompts/                         # 提示词模板（3个）
│   ├── 飞书新人引导.md
│   ├── 飞书效率诊断.md
│   └── 电商新人引导.md
├── skills/                          # 技能包
│   ├── feishu-quick-reference.md    # 飞书 API 参考
│   ├── beautiful-feishu-whiteboard/ # 35种配色画板
│   ├── mem0-skills/                 # Mem0 记忆系统
│   ├── z-excel-editor/              # 专业 Excel 编辑
│   ├── z-mail-reader/               # 邮件读取与监听
│   ├── z-md-excel/                  # Markdown → Excel
│   ├── z-smart-xparse/              # 智能文档解析
│   ├── z-web-pack/                  # 网页素材采集
│   ├── waninter-creative/           # AI图片/视频生成
│   ├── youtube-transcript-local/    # YouTube字幕提取
│   ├── christies-auctions-summary/  # 佳士得拍卖摘要
│   ├── sothebys-auctions-summary/   # 苏富比拍卖摘要
│   ├── ecom-details-image/          # 电商视觉创作（25种场景）
│   ├── agent-reach/                 # 互联网平台接入（13个）
│   ├── ecommerce-visual-copywriting/# 电商文案SOP
│   └── aesthetic-memory-skills/     # 电商视觉创作全流程
│       ├── aesthetic-memory/        # 品牌审美记忆
│       ├── design-pipeline/         # 美工全流程
│       ├── ecommerce-designer/      # 电商美工助手
│       ├── store-teardown/          # 店铺风格拆解
│       ├── xhs-note-creator/        # 小红书笔记创作
│       ├── nano-banana2/            # AI图像生成
│   └── lark-workflows/              # 飞书24个工作流
│       ├── lark-workflow-crm/        # 客户关系管理
│       ├── lark-workflow-erp-inventory/ # ERP库存管理
│       ├── lark-workflow-business-advisor/ # 商业顾问
│       ├── lark-workflow-content-pipeline/ # 内容管线
│       ├── lark-workflow-social-tracker/ # 社媒追踪
│       └── ... (24个工作流)
└── tools/                           # 工具
    └── lark-cli/                    # 飞书官方 CLI（200+命令）
        ├── QUICKSTART.md            # 快速上手指南
        ├── README.md                # 官方文档
        └── skills/ (27个)           # AI Agent Skills
```

## 目标用户

- 电商运营团队
- 电商客服团队
- 电商仓储物流团队
- 电商采购团队
- 电商财务团队
- 电商创业团队

## 安装方式

```bash
# 复制到 OpenClaw skills 目录
cp -R lobster-feishu ~/.openclaw/skills/lobster-feishu

# 或通过 ClawHub 安装（如果已发布）
clawhub install lobster-feishu-ecommerce
```

## 使用方式

安装后，直接跟 Agent 聊飞书相关的问题即可。它会：
1. 用已有的知识回答你
2. 用飞书 API 帮你操作
3. 用 Mem0 记住你的偏好
4. 把新的经验沉淀到记忆库

## 商业价值

这只龙虾的价值在于它的**记忆和案例库**——这是用时间喂出来的，不是写代码写出来的。

- 模板版：适合电商创业团队
- 企业版：包含行业案例库 + 定制训练
- 私有部署：完全在客户环境中运行
- SaaS 版：按月租用，持续更新

## License

MIT
