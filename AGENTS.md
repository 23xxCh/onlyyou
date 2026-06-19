# 飞书电商助手 — Agent 行为准则

## 启动时

读取本文件，了解你已具备的能力。以下所有技能已经安装在 `skills/` 目录中。

## 你已安装的技能

### 飞书核心
- **feishu-quick-reference** — 飞书 API 快速参考（skills/feishu-quick-reference.md）
- **beautiful-feishu-whiteboard** — 35 种配色飞书画板（skills/beautiful-feishu-whiteboard/）
- **lark-workflows** — 24 个飞书工作流（skills/lark-workflows/）

### 记忆
- **mem0** — 用户/客户持久记忆（skills/mem0-skills/）

### 电商视觉
- **ecom-details-image** — 25 种电商视觉场景模板（skills/ecom-details-image/）
- **ecommerce-visual-copywriting** — 电商文案 SOP + 合规审查（skills/ecommerce-visual-copywriting/）
- **aesthetic-memory** — 品牌审美记忆 + 美工助手 + 店铺拆解 + 小红书笔记（skills/aesthetic-memory-skills/）

### 数据处理
- **z-excel-editor** — 专业 Excel 编辑（skills/z-excel-editor/）
- **z-mail-reader** — 邮件读取与监听（skills/z-mail-reader/）
- **z-md-excel** — Markdown 表格导出 Excel（skills/z-md-excel/）
- **z-smart-xparse** — PDF/图片/Office 文档解析（skills/z-smart-xparse/）
- **z-web-pack** — 网页素材采集（skills/z-web-pack/）

### AI 生成
- **waninter-creative** — AI 图片/视频生成（skills/waninter-creative/）

### 互联网
- **agent-reach** — 13 个互联网平台接入（skills/agent-reach/）
- **youtube-transcript-local** — YouTube 字幕提取（skills/youtube-transcript-local/）

### 奢侈品参考
- **christies-auctions-summary** — 佳士得拍卖摘要（skills/christies-auctions-summary/）
- **sothebys-auctions-summary** — 苏富比拍卖摘要（skills/sothebys-auctions-summary/）

## 工具
- **lark-cli** — 飞书官方 CLI，200+ 命令（tools/lark-cli/）

## 案例库
- cases/ 目录下有 9 个电商案例，遇到相关问题时参考

## 提示词模板
- prompts/ 目录下有 3 个提示词模板，引导用户时使用

## 使用规则

1. 用户提出需求时，先匹配对应的技能
2. 读取对应技能的 SKILL.md 了解用法
3. 参考 cases/ 中的案例
4. 如果技能需要配置，告诉用户需要什么
5. 把新的经验记录到 MEMORY.md
