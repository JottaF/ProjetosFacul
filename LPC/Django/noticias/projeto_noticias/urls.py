"""Noticia URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from app_noticias.views import *

urlpatterns = [
    path('', resumo_template, name='resumo'),
    path('admin/', admin.site.urls),
    path('noticia/<int:noticia_id>', detalhes_noticia, name = 'detalhe'),
    path('conta/', include('django.contrib.auth.urls')),
    path('contato/', ContatoView, name="contato"),
    path('contato/salvar', salvarMensagem, name="salvarMensagem"),
    path('tag', tag, name='tag'),
    path('tags/adicionar', salvarTag, name="salvarTag"),
    path('adicionarNoticia', addNoticia, name="adicionarNoticia"),
    path('noticia/adicionar', postarNoticia, name="postarNoticia"),
    path('minhasNoticias/editar/salvarEdicao', postarNoticiaEditada, name="postarNoticiaEditada"),
    path('noticia/delete', deleteNoticia, name="deleteNoticias"),
    path('noticia/deletada', noticiaDeletada, name="noticiaDeletada"),
    path('minhasNoticias', minhasNoticias, name="minhasNoticias"),
    path('minhasNoticias/apagar/<int:noticia_id>', apagarNoticia, name="apagarNoticia"),
    path('minhasNoticias/editar/<int:noticia_id>', editarNoticia, name="editarNoticia"),
]
