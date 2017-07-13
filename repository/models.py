from django.db import models

# Create your models here.
from django.db import models

# Create your models here.


class UserInfo(models.Model):
    username = models.CharField(max_length=20, unique=True)
    password = models.CharField(max_length=40)
    favor = models.ManyToManyField('News', )
	# favor 判断是否有，有就减，没有就加

    class Meta:
        verbose_name_plural = '用户表'

    def __str__(self):
        return self.username


class News(models.Model):
    title = models.CharField(max_length=100)
    summary = models.TextField()
    href = models.CharField(max_length=50)
    news_type_choices = [
        (1, '42区'),
        (2, '段子'),
        (3, '图片'),
        (4, '挨踢1024'),
        (5, '你问我答'),
    ]
    nt_id = models.IntegerField(choices=news_type_choices)
    ctime = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey('UserInfo')
	
    favor_num = models.IntegerField(default=0)
    comment_num = models.IntegerField(default=0)
	# 下面的注释也可以实现，但是会影响查询效率，favor_num 这个字段属于查多操作少的
	# 所以，如果在操作时，这个favor字段也自增自减。查的时候就查这个
    # def favor_num(self):
    #     return self.userinfo_set.all().count()

    class Meta:
        verbose_name_plural = '新闻表'

    def __str__(self):
        return self.title


class Comment(models.Model):
    content = models.CharField(max_length=150)
    user = models.ForeignKey('UserInfo')
    new = models.ForeignKey('News')
    ctime = models.DateTimeField(auto_now_add=True)
    device = models.CharField(max_length=16, null=True, blank=True)
    parent_id = models.ForeignKey('Comment', related_name='q1', null=True, blank=True)

    class Meta:
        verbose_name_plural = '评论表'