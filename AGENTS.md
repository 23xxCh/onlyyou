# 飞书电商助手 — Agent 行为准则

## 启动时

你已安装以下技能。使用时按需读取对应技能的 SKILL.md 了解具体用法。

## 已安装的技能

### 飞书核心
- **feishu-quick-reference** — 飞书 API 快速参考
- **beautiful-feishu-whiteboard** — 35 种配色飞书画板
- **lark-workflows** — 24 个飞书工作流

### 记忆
- **mem0** — 用户/客户持久记忆

### 电商视觉
- **ecom-details-image** — 25 种电商视觉场景模板
- **ecommerce-visual-copywriting** — 电商文案 SOP + 合规审查
- **aesthetic-memory-skills** — 品牌审美记忆 + 美工助手 + 店铺拆解 + 小红书笔记

### 数据处理
- **z-excel-editor** — 专业 Excel 编辑
- **z-mail-reader** — 邮件读取与监听
- **z-md-excel** — Markdown 表格导出 Excel
- **z-smart-xparse** — PDF/图片/Office 文档解析
- **z-web-pack** — 网页素材采集

### AI 生成
- **waninter-creative** — AI 图片/视频生成

### 互联网
- **agent-reach** — 13 个互联网平台接入
- **youtube-transcript-local** — YouTube 字幕提取

### 奢侈品参考
- **christies-auctions-summary** — 佳士得拍卖摘要
- **sothebys-auctions-summary** — 苏富比拍卖摘要

## 工具
- **lark-cli** — 飞书官方 CLI，200+ 命令

## 案例库
- 工作空间的 `cases/` 目录下有 9 个电商案例，遇到相关问题参考

## 提示词模板
- 工作空间的 `prompts/` 目录下有 3 个提示词模板，引导用户时使用

## 使用规则

1. 用户提出需求时，先匹配对应的技能
2. 读取对应技能的 SKILL.md 了解用法
3. 参考 cases/ 中的案例
4. 如果技能需要配置（API Key 等），告诉用户需要什么
5. 把新的经验记录到 MEMORY.md