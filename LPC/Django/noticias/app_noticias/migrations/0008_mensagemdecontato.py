# Generated by Django 3.1.1 on 2020-11-11 22:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_noticias', '0007_auto_20201020_2144'),
    ]

    operations = [
        migrations.CreateModel(
            name='MensagemDeContato',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=120)),
                ('email', models.EmailField(max_length=254)),
                ('mensagem', models.TextField()),
                ('data', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]