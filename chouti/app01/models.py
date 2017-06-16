# from django.db import models
#
# # Create your models here.
#
#
# class UserInfo(models.Model):
#     username = models.CharField(max_length=20)
#     password = models.CharField(max_length=40)
#     favor = models.ManyToManyField('News')
#
#
# class News(models.Model):
#     title = models.CharField(max_length=100)
#     summary = models.TextField()
#     href = models.CharField(max_length=50)
#     news_type_choices = [
#         (1, '42区'),
#         (2, '段子'),
#         (3, '图片'),
#         (4, '挨踢1024'),
#         (5, '你问我答'),
#     ]
#     nt_id = models.IntegerField(choices=news_type_choices)
#     ctime = models.DateTimeField(auto_now_add=True)
#     author = models.ForeignKey('UserInfo')
#
#     def favor_num(self):
#         return self.userinfo_set.all().count()
#
#
# class Comment(models.Model):
#     content = models.TextField()
#     user = models.ForeignKey('UserInfo')
#     new = models.ForeignKey('News')
#     ctime = models.DateTimeField(auto_now_add=True)
#     parent_id = models.ForeignKey('Comment', related_name='q1')
