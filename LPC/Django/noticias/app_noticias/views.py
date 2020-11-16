from django.shortcuts import render, redirect, reverse
from django.views.generic.edit import FormView
from django.http import HttpResponse, Http404, HttpResponseRedirect
from app_noticias.forms import ContatoForm, TagForm, AddNoticiaForm
from django.contrib.auth.models import User
from app_noticias.models import Tag
from django import forms

from app_noticias.models import Noticia, MensagemDeContato, Tag

def home_page(request):
    return render(request, 'app_noticia/home_page.html', {})

def resumo_template(request):
    noticias = []

    for i in Noticia.objects.all():
        noticias.insert(0, i) 

    return render(request, 'app_noticia/resumo.html', {'noticia': noticias})

def detalhes_noticia(request, noticia_id):
    noticia = Noticia.objects.get(pk=noticia_id)
    return render(request, 'app_noticia/detalhe.html', { 'noticia': noticia })

def ContatoView(request):
    formulario = ContatoForm()
    return render(request, 'app_noticia/contato.html', {'form':formulario})

def contato(request):
    formulario = ContatoForm()
    return render(request, 'app_noticia/contato.html', {})

def salvarMensagem(request):
    if request.method == 'POST':
        dados = request.POST

        mensagem = MensagemDeContato()

        mensagem.nome = dados.get('nome')
        mensagem.email = dados.get('email')
        mensagem.mensagem = dados.get('mensagem')

        if '@gmail.com' in mensagem.email:
            return HttpResponse('Provedor de email não suportado.')

        palavras = ['defeito', 'erro', 'problema']
        for i in palavras:
            if i in mensagem.mensagem:
                return HttpResponse('A mensagem contem palavras não permitidas.')
        
        mensagem.save()

        return render(request, 'app_noticia/contato_sucesso.html', {})

def tag(request):
    if request.user.is_authenticated:
        formulario = TagForm()
        return render(request, 'app_noticia/tag.html', {'form': formulario})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def salvarTag(request):
    if request.method == 'POST':
        dados = request.POST

        tag = Tag()

        tag.nome = dados.get('nome')
        tag.slug = dados.get('slug')

        tag.save()

        return render(request, 'app_noticia/tag_sucesso.html', {})


def addNoticia(request):
    tags = Tag.objects.all()

    if request.user.is_authenticated:
        formulario = AddNoticiaForm()
        return render(request, 'app_noticia/noticia_adicionar.html', {'form': formulario, 'tags':tags})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def postarNoticia(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            dados = request.POST

            noticia = Noticia()

            noticia.autor = User.objects.get(username = request.user).pessoa
            noticia.titulo = dados.get('titulo')
            noticia.resumo = dados.get('resumo')
            noticia.descricao = dados.get('descricao')
            noticia.save()

            for i in dados.getlist('tags'):
                noticia.tags.add(Tag.objects.get(pk=i))
            

            return render(request, 'app_noticia/noticia_postada.html', {})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def postarNoticiaEditada(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            dados = request.POST
            noticia = Noticia.objects.get(pk = dados.get('id'))

            noticia.titulo = dados.get('titulo')
            noticia.resumo = dados.get('resumo')
            noticia.descricao = dados.get('descricao')
            noticia.save()
            
            for i in dados.getlist('tags'):
                if not Tag.objects.get(pk = i) in noticia.tags.all():
                    noticia.tags.add(Tag.objects.get(pk = i))

            return render(request, 'app_noticia/noticia_editada.html', {})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def minhasNoticias(request):
    if request.user.is_authenticated:
        user = User.objects.get(username = request.user).pessoa
        noticias = []

        for i in Noticia.objects.filter(autor = user):
            noticias.insert(0, i)  

        return render(request, 'app_noticia/noticia_pessoais.html', {'noticias':noticias})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def apagarNoticia(request, noticia_id):    
    if request.user.is_authenticated:
        noticia = Noticia.objects.get(pk=noticia_id)
        return render(request, 'app_noticia/noticia_confirmar_delete.html', {'noticia':noticia})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def editarNoticia(request, noticia_id):    
    tags = Tag.objects.all()

    if request.user.is_authenticated:
        formulario = AddNoticiaForm()
        noticia = Noticia.objects.get(pk=noticia_id)
        return render(request, 'app_noticia/noticia_editar.html', {'form':formulario, 'noticia':noticia, 'tags':tags})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def deleteNoticia(request):
    if request.method == 'POST':
        if request.user.is_authenticated:
            dados = request.POST

            noticia = Noticia.objects.get(pk = dados.get('id'))
            noticia.delete()

            return render(request, 'app_noticia/noticia_apagada.html')
        else:
            return render(request, 'app_noticia/erro_acesso.html', {})

def noticiaDeletada(request):
    if request.user.is_authenticated:
        user = User.objects.get(username = request.user).pessoa
        noticias = []

        for i in Noticia.objects.filter(autor = user):
            noticias.insert(0, i)  

        return render(request, 'app_noticia/noticia_pessoais.html', {'noticias':noticias})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})
