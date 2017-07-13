# -*- coding: utf-8 -*-
# Generated by Django 1.11.1 on 2017-06-10 02:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('repository', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='device',
            field=models.CharField(blank=True, max_length=16, null=True),
        ),
        migrations.AlterField(
            model_name='comment',
            name='content',
            field=models.CharField(max_length=150),
        ),
        migrations.AlterField(
            model_name='comment',
            name='parent_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='q1', to='repository.Comment'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='username',
            field=models.CharField(max_length=20, unique=True),
        ),
    ]