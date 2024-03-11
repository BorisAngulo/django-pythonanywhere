"""Proyectoweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
from django.conf.urls.static import static#importamos estos dos para poder mostrar las imagenes
from django.conf import settings
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('proyectoWebApp.urls')),#incluye todas las urls de la app creada 
    path('servicios/', include('servicios.urls')),#incluye todas las urls de la app creada 
    path('blog/', include('blog.urls')),#incluye todas las urls de la app creada 
    path('contacto/', include('contacto.urls')),#incluye todas las urls de la app creada
    path('tienda/', include('tienda.urls')),#incluye todas las urls de la app creada
    path('carro/', include('carro.urls')),#incluye todas las urls de la app creada
    path('autenticacion/', include('autenticacion.urls')),#incluye todas las urls de la app creada
    path('pedidos/', include('pedidos.urls')),#incluye todas las urls de la app creada
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)#con esta linea de codigo le decimos a django que muestre las imagenes
