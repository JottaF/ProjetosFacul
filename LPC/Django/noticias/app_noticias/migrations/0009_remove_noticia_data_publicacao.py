# Generated by Django 3.1.2 on 2020-11-15 02:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app_noticias', '0008_mensagemdecontato'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='noticia',
            name='data_publicacao',
        ),
    ]