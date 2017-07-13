import json
from django.shortcuts import render, redirect, HttpResponse
from io import BytesIO

from repository.models import *
from app01.forms import LoginForm
from app01.forms import PublishForm
from utils.page import PageInfo
from utils.reponse_data import BaseReponse
import datetime


# Create your views here.

def create(request):
    for i in range(10):
        News.objects.create(
            title='奥尼尔',
            summary='1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大',
            href='/static/images/picture/aopang.jpg',
            nt_id=1,
            author_id=1,
        )
        News.objects.create(
            title='艾弗森',
            summary='阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...',
            href='/static/images/picture/AI.jpg',
            nt_id=1,
            author_id=1,
        )
        News.objects.create(
            title='姚明',
            summary='姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...',
            href='/static/images/picture/yao.jpg',
            nt_id=1,
            author_id=1,
        )
        News.objects.create(
            title='艾弗森',
            summary='特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...',
            href='/static/images/picture/maidi.jpg',
            nt_id=1,
            author_id=1,
        )
    return HttpResponse('OK')


def auth(fun):
    def wrapper(request, *args, **kwargs):
        u = request.session.get('u')
        if not u:
            response = BaseReponse()
            response.no_login = True
            return HttpResponse(json.dumps(response.__dict__))
        return fun(request, *args, **kwargs)
    return wrapper


@auth
def favor(request):
    if request.method == 'POST':
        user_obj = UserInfo.objects.get(username=request.session['u'])
        nid = request.POST.get('nid')
        favor_num = user_obj.favor.all().filter(id=nid).count()
        new_obj = News.objects.get(id=nid)
        response = BaseReponse()
        response.data = nid
        if favor_num == 0:
            # print('+')
            user_obj.favor.add(new_obj)
            # temp = int + 1
            temp = new_obj.favor_num + 1
            News.objects.filter(id=nid).update(favor_num=temp)
            response.status = True
        else:
            # print('-')
            user_obj.favor.remove(new_obj)
            temp = new_obj.favor_num - 1
            News.objects.filter(id=nid).update(favor_num=temp)
            response.status = False
    return HttpResponse(json.dumps(response.__dict__))


@auth
def comment(request):
    if request.method == 'POST':
        comment_list = Comment.objects.filter(new_id=request.POST.get('nid')).values()
        comment_dict = {}
        for row in comment_list:
            row['child'] = []
            row['ctime'] = str(row['ctime'])
            comment_dict[row['id']] = row

        for row in comment_list:
            if row['parent_id_id']:
                parent_id = row['parent_id_id']
                comment_dict[parent_id]['child'].append(row)
        comment_reuslt = {}

        for k, v in comment_dict.items():
            if v['parent_id_id'] == None:
                comment_reuslt[k] = v
        html_str = create_html(comment_reuslt)
        response = BaseReponse()
        response.data = html_str
        return HttpResponse(json.dumps(response.__dict__))


def create_child_html(child_comment):
    prve = """
        <div class="comment">
            <div class="content">
                <ul class="list-group">
       """
    for child in child_comment:
        tpl = '<li class="list-group-item">%s</li>'
        comment_str = tpl % child['content']
        prve = prve + comment_str
        if child['child']:
            # 有孙子评论，递归执行
            child = create_child_html(child['child'])
            prve = prve + child
    end = """
       </ul>
       </div>
       </div>
       """
    return prve + end


def create_html(comment_reuslt):
    prve = """
     <div class="comment">
         <div class="content">
             <ul class="list-group">
    """
    for k, v in comment_reuslt.items():
        tpl = '<li class="list-group-item">%s</li>'
        comment_str = tpl % v['content']
        prve = prve + comment_str
        if v['child']:
            # 有子评论
            child = create_child_html(v['child'])
            print(v['child'])
            prve = prve + child
    end = """
    </ul>
    </div>
    </div>
    """
    return prve + end


def app(request):
    all_obj = News.objects.all().select_related('author')
    all_count = all_obj.count()
    page_info = PageInfo(request.GET.get('p'), 10, all_count, request.path_info)
    all_list = all_obj[page_info.start():page_info.end()]
    publish_form = PublishForm()
    login_form = LoginForm()

    for i in all_list:
        time_obj = datetime.datetime.now() - i.ctime.replace(tzinfo=None)
        time_list = str(time_obj).split(':')
        i.ctime = '%s小时%s分钟前' % (time_list[-3], time_list[-2])
    return render(request, 'all.html', {'login_form': login_form,
                                        'publish_form': publish_form,
                                        'all_obj': all_list,
                                        'page_info': page_info})


def publish(request):
    '''
    发布内容，主要图片的操作
    :param request:
    :return:
    '''
    import os
    response = BaseReponse()
    print(request.POST)
    publish_form = PublishForm(request.POST)
    if publish_form.is_valid():
        print('OK')
        try:
            obj = request.FILES.get('picture_file')
            file_path = os.path.join('static/images/picture', obj.name)
            f = open(file_path, 'wb')
            for chunk in obj.chunks():
                f.write(chunk)
            f.close()
            user_obj = UserInfo.objects.filter(username=request.session['u']).first()
            print(user_obj.id)
            News.objects.create(
                title=publish_form.cleaned_data['title'],
                summary=publish_form.cleaned_data['summary'],
                href=os.path.join('/', file_path),
                nt_id=publish_form.cleaned_data['nt_id'],
                author_id=user_obj.id
            )
            response.status = True
        except Exception as e:
            response.status = False
            response.error = "上传失败"

    else:
        response.status = False
        response.data = publish_form.errors
    return HttpResponse(json.dumps(response.__dict__))


def login(request):
    '''
    form验证通过先判断验证码
    :param request:
    :return:
    '''
    if request.method == 'POST':
        response = BaseReponse()
        login_obj = LoginForm(request.POST)
        if login_obj.is_valid():
            if login_obj.cleaned_data.get('auth_code').upper() == request.session['check_code'].upper():
                u = UserInfo.objects.filter(
                    username=login_obj.cleaned_data['username'],
                    password=login_obj.cleaned_data['password'],
                ).first()
                if u:
                    request.session['u'] = u.username
                    response.status = True

                else:
                    response.status = False
                    response.error = "用户名或密码错误"
            else:
                response.status = False
                response.error = "验证码错误"
        else:
            response.status = False
            response.data = login_obj.errors
        # ensure_ascii=False 调试时用
        return HttpResponse(json.dumps(response.__dict__, ensure_ascii=False))


def auth_code(request):
    '''
    auth code create
    :param request:
    :return:
    '''
    from utils.check_code import create_validate_code
    img_obj, code = create_validate_code()
    stream = BytesIO()
    img_obj.save(stream, 'png')
    request.session['check_code'] = code
    return HttpResponse(stream.getvalue())