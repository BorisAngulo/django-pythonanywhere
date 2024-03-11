from django.shortcuts import render
from blog.models import Categoria, Post
# Create your views here.
def blog(request):
    posts = Post.objects.all()
    return render(request, "blog/blog.html", {"posts":posts})

def categoria(request, categoria_id):
    categorias = Categoria.objects.get(id=categoria_id)#filtramos por el parametro que se pasara
    posts = Post.objects.filter(categorias=categorias)#filtramos por el parametro que se pasara
    return render(request, "blog/categorias.html", {"categoria":categorias, "posts":posts})