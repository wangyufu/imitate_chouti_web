#!/usr/bin/env python

from django import forms
from django.forms import fields
from django.forms import widgets


class LoginForm(forms.Form):
    username = fields.CharField(
        required=True,
        error_messages={'required': '用户名不能为空'},
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )
    password = fields.CharField(
        required=True,
        error_messages={'required': '密码不能为空'},
        widget=widgets.PasswordInput(attrs={'class': 'form-control'})
    )
    auth_code = fields.CharField(
        required=True,
        error_messages={'required': '验证码不能不能为空'},
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )


class PublishForm(forms.Form):
    title = forms.CharField(max_length=20,
                            min_length=5,
                            error_messages={'required': '标题不能为空',
                                            'max_length': '标题最多为100个字符',
                                            'min_length': '标题最少为5个字符'},
                            widget=forms.TextInput(attrs={'class': "form-control",
                                                          'placeholder': '标题5-20个字符'}))

    summary = forms.CharField(required=True,
                              max_length=256,
                              error_messages={'required': '简介不能为空', },
                              widget=forms.widgets.Textarea(
                                  attrs={'class': "form-control no-radius", 'placeholder': '详细描述', 'rows': 3}))

    # href = forms.FilePathField(
    #                            error_messages={'required': '文件不能为空',},
    #                            widget=forms.widgets.Select(
    #                                attrs={'class': "form-control", 'placeholder': '图片'}))

    news_type_choice = (
        (1, '42区'),
        (2, '段子'),
        (3, '图片'),
        (4, '挨踢1024'),
        (5, '你问我答'),
    )

    nt_id = forms.IntegerField(widget=forms.widgets.Select(choices=news_type_choice,
                                                           attrs={'class': "form-control"}))
