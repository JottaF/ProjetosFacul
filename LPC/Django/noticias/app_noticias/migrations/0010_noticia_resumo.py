# Generated by Django 3.1.2 on 2020-11-15 02:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_noticias', '0009_remove_noticia_data_publicacao'),
    ]

    operations = [
        migrations.AddField(
            model_name='noticia',
            name='resumo',
            field=models.TextField(blank=True, max_length=500, null=True),
        ),
    ]