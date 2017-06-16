from django.test import TestCase

# Create your tests here.
comment_list = [
    {'id': 1, 'news_id': 1, 'user_id': 10, 'content': "写的什么玩意呀", 'reply_id': None},
    {'id': 2, 'news_id': 1, 'user_id': 11, 'content': "还真不是玩意 ", 'reply_id': 1},
    {'id': 3, 'news_id': 1, 'user_id': 12, 'content': "写的真好 ", 'reply_id': 1},
    {'id': 4, 'news_id': 1, 'user_id': 11, 'content': "写的真好 ", 'reply_id': 3},
    {'id': 5, 'news_id': 1, 'user_id': 19, 'content': "sdfsfsdsd ", 'reply_id': None},
]
# comment_dict = {
#     1:{'id': 1, 'news_id': 1, 'user_id': 10, 'content': "写的什么玩意呀", 'reply_id': None, 'child': [{'id': 2, 'news_id': 1, 'user_id': 11, 'content': "还真不是玩意 ", 'reply_id': 1},{'id': 3, 'news_id': 1, 'user_id': 12, 'content': "写的真好 ", 'reply_id': 1,'child': [{'id': 4, 'news_id': 1, 'user_id': 11, 'content': "写的真好 ", 'reply_id': 3,'child': []},]},]},
#     2:{'id': 2, 'news_id': 1, 'user_id': 11, 'content': "还真不是玩意 ", 'reply_id': 1,'child': []},
#     3:{'id': 3, 'news_id': 1, 'user_id': 12, 'content': "写的真好 ", 'reply_id': 1,'child': [{'id': 4, 'news_id': 1, 'user_id': 11, 'content': "写的真好 ", 'reply_id': 3,'child': []},]},
#     4:{'id': 4, 'news_id': 1, 'user_id': 11, 'content': "写的真好 ", 'reply_id': 3,'child': []},
#     5: {'id': 5, 'news_id': 1, 'user_id': 19, 'content': "sdfsfsdsd ", 'reply_id': None,'child': []},
# }

comment_dict = {}
for row in comment_list:
    row['child'] = []
    comment_dict[row['id']] = row

# a = [1,2,3]
# b = a
# b 等于的是a列表的内存地址 ， 所有改变b里面的值a里面也会跟着变化
# 字典也是

for row in comment_list:
    if row['reply_id']:
        reply_id = row['reply_id']
        comment_dict[reply_id]['child'].append(row)

commen_reuslt = {}

# 把根数据取出来
for k,v in comment_dict.items():
    if v['reply_id'] == None:
        commen_reuslt[k] = v

print(len(commen_reuslt), commen_reuslt)
