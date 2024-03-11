from django.db import models
from django.contrib.auth.models import User#para relacionar con el usuario

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'categoria'
        verbose_name_plural = 'categorias'

    def __str__(self):
        return self.nombre
    
class Post(models.Model):
    titulo = models.CharField(max_length=50)
    contenido = models.CharField(max_length=50)
    imagen = models.ImageField(upload_to='blog', null=True, blank=True)#creamos una carpeta para las imagenes, tambien puede ser null y blank
    autor = models.ForeignKey(User, on_delete=models.CASCADE)#relacionamos con el usuario y los post se eliminaran si el usuario se elimina
    categorias=models.ManyToManyField(Categoria)#relacionamos con la categoria con relacion muchos a muchos
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'post'
        verbose_name_plural = 'posts'

    def __str__(self):
        return self.titulo


