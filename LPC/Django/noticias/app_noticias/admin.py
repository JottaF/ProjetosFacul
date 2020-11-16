from django.contrib import admin

from app_noticias.models import Noticia, Pessoa, Tag, MensagemDeContato

admin.site.register(Noticia)
admin.site.register(Pessoa)
admin.site.register(Tag)
admin.site.register(MensagemDeContato)
