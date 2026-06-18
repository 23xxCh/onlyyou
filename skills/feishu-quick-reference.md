# 飞书快速参考卡

## 文档操作
- 创建文档：`feishu_create_doc`
- 读取文档：`feishu_fetch_doc`
- 更新文档：`feishu_update_doc`（支持 overwrite/append/replace_range）
- 搜索文档：`feishu_search_doc_wiki`
- 文档评论：`feishu_doc_comments`

## 多维表格 (Bitable)
- 创建/管理应用：`feishu_bitable_app`
- 管理数据表：`feishu_bitable_app_table`
- 管理字段：`feishu_bitable_app_table_field`
- 管理记录：`feishu_bitable_app_table_record`
- 管理视图：`feishu_bitable_app_table_view`

## 电子表格 (Sheet)
- 创建/读写：`feishu_sheet`
- 支持操作：info/read/write/append/find/create/export

## 日历
- 日历管理：`feishu_calendar_calendar`
- 日程管理：`feishu_calendar_event`
- 参会人管理：`feishu_calendar_event_attendee`
- 忙闲查询：`feishu_calendar_freebusy`

## 任务
- 任务管理：`feishu_task_task`
- 清单管理：`feishu_task_tasklist`
- 子任务：`feishu_task_subtask`
- 自定义分组：`feishu_task_section`
- 评论：`feishu_task_comment`

## 知识库 (Wiki)
- 空间管理：`feishu_wiki_space`
- 节点管理：`feishu_wiki_space_node`

## 即时通讯 (IM)
- 搜索群聊：`feishu_chat`
- 群成员：`feishu_chat_members`
- 发送消息：`feishu_im_user_message`
- 获取消息：`feishu_im_user_get_messages`
- 搜索消息：`feishu_im_user_search_messages`

## 用户
- 获取用户信息：`feishu_get_user`
- 搜索用户：`feishu_search_user`

## 云空间
- 文件管理：`feishu_drive_file`
- 媒体管理：`feishu_doc_media`
