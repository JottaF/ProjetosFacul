from django.contrib.auth.models import User
from django.db import models


class Pessoa(models.Model):
    usuario = models.OneToOneField(
        User, on_delete=models.CASCADE, verbose_name='Usuário')
    nome = models.CharField(verbose_name='Nome', max_length=130)
    data_de_nascimento = models.DateField()
    email = models.EmailField(verbose_name='E-mail', null=True, blank=True)

    def __str__(self):
        return self.nome

class Tag(models.Model):
    nome = models.CharField(max_length=64)
    slug = models.SlugField(max_length=64)

    def __str__(self):
        return self.nome


class Noticia(models.Model):
    class Meta:
        verbose_name = 'Notícia'
        verbose_name_plural = 'Notícias'

    autor = models.ForeignKey(Pessoa, on_delete=models.CASCADE, null=True, blank=True)
    tags = models.ManyToManyField(Tag)
    titulo = models.CharField(max_length=120, null=True, blank=True)
    resumo = models.TextField(max_length=500, null=True, blank=True)
    descricao = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.titulo


class MensagemDeContato(models.Model):
    nome = models.CharField(max_length=120)
    email = models.EmailField()
    mensagem = models.TextField()
    data = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.email

