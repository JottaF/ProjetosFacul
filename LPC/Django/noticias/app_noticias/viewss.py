from django.views.generic.edit import FormView
from django.http import HttpResponse, Http404
from django.shortcuts import render
from app_noticias.models import Noticia, MensagemDeContato, Tag
from app_noticias.forms import ContatoForm, TagForm, AddNoticiaForm


def home_page(request):
    noticias = Noticia.objects.all()

    return render(request, 'app_noticia/home_page.html', {'todas_noticias': noticias})

def resumo(request):
    total = Noticia.objects.count()
    html = '''
        <html>
            <body>
                <h1>Resumo</h1>
                <p> A quantidade total de noticias é {} </p>
            </body>
        </html>
        '''.format(total)

    return HttpResponse(html)

def resumo_template(request):
    total = Noticia.objects.count()
    return render(request, 'app_noticia/resumo.html', {'total': total})

def detalhes_noticia(request, noticia_id):
    if request.user.is_authenticated:
        try:
            noticia = Noticia.objects.get(pk=noticia_id)
            tags = []

            for item in noticia.tags.all():
                tags.append(item.nome)

            texto = ', '.join(tags)

        except Noticia.DoesNotExist:
            raise Http404("Noticia não encontrada")
        
        return render(request, 'app_noticia/detalhes.html', {'noticia': noticia, 'tags_texto': texto})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def contato(request):
    formulario = ContatoForm()
    return render(request, 'app_noticia/contato.html', {'form': formulario})


def salvar_mensagem(request):
    if request.method == 'POST':
        dados = request.POST

        mensagem = MensagemDeContato()
        mensagem.nome = dados.get('nome')
        mensagem.email = dados.get('email')
        mensagem.mensagem = dados.get('mensagem')

        email = dados.get('email')
        if '@gmail.com' in email:
            return HttpResponse('Provedor de email nao suportado')

        mensagem_texto = dados.get('mensagem')
        palvras = ['defeito', 'erro', 'problema']
        for palavra in palvras:
            if palavra in mensagem_texto.lower():
                return HttpResponse('Palavras nao permitidas')

        mensagem.save()

        return render(request, 'app_noticia/contato_sucesso.html', {})

def tag(request):
    if request.user.is_authenticated:
        formulario = TagForm()
        return render(request, 'app_noticia/tag.html', {'form': formulario})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def salvarTag(request):
    tagAdd = False
    if request.method == 'POST':
        dados = request.POST

        tag = Tag()

        tag.nome = dados.get('nome')
        tag.slug = dados.get('slug')

        tag.save()
        tagAdd = True

        return render(request, 'app_noticia/tag_sucesso.html', {'tagAdd':tagAdd})


def addNoticia(request):
    if request.user.is_authenticated:
        formulario = AddNoticiaForm()
        return render(request, 'app_noticia/adicionar-noticia.html', {'form': formulario})
    else:
        return render(request, 'app_noticia/erro_acesso.html', {})

def postarNoticia(request):
    tagAdd = False
    if request.method == 'POST':
        dados = request.POST

        noticia = Noticia()

        noticia.autor = request

        tag.save()
        tagAdd = True

        return render(request, 'app_noticia/tag_sucesso.html', {'tagAdd':tagAdd})