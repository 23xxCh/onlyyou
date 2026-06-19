# 飞书电商助手

> 专为电商团队打造的飞书 AI 技能包

## 一键安装

**告诉你的飞书 Aily：**

```
帮我安装：https://gitee.com/cxx450/onlyyou
```

**或手动安装：**

```bash
git clone https://gitee.com/cxx450/onlyyou.git /tmp/feishu-ecommerce && bash /tmp/feishu-ecommerce/install.sh
```

**更新：**

```bash
cd ~/.aily/skills && for d in feishu-*/; do cd "$d" && git pull && cd ..; done
```

---

## 这是什么

飞书电商助手是一个**已经养好**的 AI 技能包。安装后，16 个技能会分别装到 `~/.aily/skills/`，与 Aily 现有的 102 个技能并列。

### 包含内容

| 类别 | 数量 | 安装位置 |
|---|---|---|
| 技能包 | 16 个 | `~/.aily/skills/` |
| 飞书工作流 | 24 个 | `~/.aily/skills/lark-workflows/` |
| 电商案例 | 9 个 | `~/.aily/workspace/cases/` |
| 提示词模板 | 3 个 | `~/.aily/workspace/prompts/` |
| CLI 工具 | 1 套 | `~/.aily/tools/lark-cli/` |

---

## 能做什么

### 飞书操作
- 选品管理看板、库存预警、大促排期、客服工单、数据看板、供应商管理、知识库

### 视觉创作
- 电商主图/详情页（25种场景）、电商文案（含合规审查）、竞品店铺拆解、小红书笔记、飞书白板（35种配色）

### 互联网调研
- Twitter / 小红书 / YouTube / Reddit / B站 竞品分析、素材采集

### 数据处理
- Excel 编辑、PDF/图片解析、Markdown 导出

---

## 功能配置

| 功能 | 状态 | 配置方式 |
|---|---|---|
| 飞书文档/表格/日历/任务 | 开箱即用 | 通过飞书插件 |
| 电商案例库 | 开箱即用 | 无需配置 |
| AI 生图/视频 | 需配置 | Waninter API Key |
| 邮件监听 | 需配置 | IMAP 邮箱信息 |
| 互联网搜索 | 需配置 | pip install agent-reach |
| 小红书 | 需配置 | 浏览器 Cookie |

---

## 安装后结构

```
~/.aily/
├── workspace/
│   ├── AGENTS.md              ← 追加了飞书电商助手行为准则
│   ├── WELCOME.md             ← 安装后自动生成
│   ├── cases/                 ← 9 个电商案例
│   └── prompts/               ← 3 个提示词模板
├── skills/
│   ├── aily-writer/           ← 原有 102 个技能...
│   ├── ...                    ←
│   ├── ecom-details-image/          ← 新增
│   ├── ecommerce-visual-copywriting/← 新增
│   ├── aesthetic-memory-skills/     ← 新增
│   ├── mem0-skills/                 ← 新增
│   ├── agent-reach/                 ← 新增
│   ├── waninter-creative/           ← 新增
│   ├── z-excel-editor/              ← 新增
│   ├── z-mail-reader/               ← 新增
│   ├── z-smart-xparse/              ← 新增
│   ├── z-web-pack/                  ← 新增
│   ├── z-md-excel/                  ← 新增
│   ├── beautiful-feishu-whiteboard/ ← 新增
│   ├── youtube-transcript-local/    ← 新增
│   ├── christies-auctions-summary/  ← 新增
│   ├── sothebys-auctions-summary/   ← 新增
│   └── lark-workflows/              ← 新增（含24个工作流）
└── tools/
    └── lark-cli/              ← 新增
```

---

## License

MIT

## 致谢

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