from django import forms
from django.contrib.auth.forms import User
from app_noticias.models import Tag

class ContatoForm(forms.Form):
    nome = forms.CharField(max_length=120)
    email = forms.EmailField(required=False)
    mensagem = forms.CharField(widget=forms.Textarea)

class TagForm(forms.Form):
    nome = forms.CharField(max_length=120)
    slug = forms.SlugField()

class AddNoticiaForm(forms.Form):
    autor = User()
    tags = forms.ModelMultipleChoiceField(widget = forms.CheckboxSelectMultiple, queryset = Tag.objects.all())
    titulo = forms.CharField(max_length=120)
    resumo = forms.CharField(max_length=500, widget=forms.Textarea)
    descricao = forms.CharField(widget=forms.Textarea)
