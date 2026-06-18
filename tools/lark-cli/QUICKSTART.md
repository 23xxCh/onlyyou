# lark-cli 快速上手指南

> 飞书官方 CLI 工具，200+ 命令，26 个 AI Agent Skills

## 安装（1 分钟）

```bash
npx @larksuite/cli@latest install
```

## 配置（首次使用，3 分钟）

### 1. 初始化应用凭证

```bash
lark-cli config init
```

交互式引导，会打开浏览器完成飞书应用创建。

### 2. 登录授权

```bash
lark-cli auth login --recommend
```

`--recommend` 自动选择常用权限范围。

### 3. 验证登录状态

```bash
lark-cli auth status
```

## 常用命令速查

### 日历

```bash
lark-cli calendar +agenda              # 查看今日日程
lark-cli calendar +create              # 创建日程
lark-cli calendar +freebusy            # 查询忙闲
```

### 消息

```bash
lark-cli im +send                      # 发送消息
lark-cli im +reply                     # 回复消息
lark-cli im +search                    # 搜索消息
```

### 文档

```bash
lark-cli doc +create                   # 创建文档
lark-cli doc +fetch                    # 读取文档
lark-cli doc +update                   # 更新文档
```

### 多维表格 (Base)

```bash
lark-cli base +list-tables             # 列出数据表
lark-cli base +create-record           # 创建记录
lark-cli base +list-records            # 列出记录
```

### 电子表格 (Sheets)

```bash
lark-cli sheets +read                  # 读取数据
lark-cli sheets +write                 # 写入数据
lark-cli sheets +append                # 追加数据
```

### 任务

```bash
lark-cli task +create                  # 创建任务
lark-cli task +list                    # 列出任务
lark-cli task +complete                # 完成任务
```

### 知识库 (Wiki)

```bash
lark-cli wiki +list-spaces             # 列出知识空间
lark-cli wiki +create-node             # 创建节点
```

### 审批

```bash
lark-cli approval +list-tasks          # 列出审批任务
lark-cli approval +approve             # 通过审批
lark-cli approval +reject              # 拒绝审批
```

### 邮件

```bash
lark-cli mail +list                    # 列出邮件
lark-cli mail +send                    # 发送邮件
lark-cli mail +search                  # 搜索邮件
```

## 三层命令架构

| 层级 | 说明 | 适合谁 |
|---|---|---|
| **Shortcuts** (`+agenda`) | 人类/AI 友好的快捷命令 | 日常使用 |
| **API Commands** (`calendar event list`) | 与平台 API 同步 | 精确控制 |
| **Raw API** (`raw`) | 完整 API 覆盖 | 高级场景 |

## AI Agent Skills

lark-cli 内置 26 个 AI Agent Skill，位于 `skills/` 目录：

| Skill | 说明 |
|---|---|
| lark-shared | 应用配置、登录、身份切换（所有 Skill 自动加载） |
| lark-calendar | 日历、日程、忙闲、会议室 |
| lark-im | 消息、群聊、搜索、媒体 |
| lark-doc | 文档 CRUD |
| lark-drive | 文件上传下载、权限 |
| lark-sheets | 电子表格 |
| lark-base | 多维表格 |
| lark-task | 任务管理 |
| lark-mail | 邮件 |
| lark-wiki | 知识库 |
| lark-approval | 审批 |
| lark-vc | 会议 |
| lark-whiteboard | 画板 |
| lark-slides | 幻灯片 |
| lark-contact | 通讯录 |
| lark-okr | OKR |

## 安全提示

- 凭证存储在操作系统原生钥匙串中
- 输入注入防护
- 终端输出清理
- 建议使用 `--recommend` 自动选择安全的权限范围

## 与飞书龙虾配合使用

飞书龙虾可以通过两种方式操作飞书：

1. **OpenClaw 飞书插件**：直接调用飞书 API（已集成）
2. **lark-cli**：命令行工具，适合批量操作和脚本场景

推荐：日常交互用 OpenClaw 插件，批量/脚本场景用 lark-cli。
