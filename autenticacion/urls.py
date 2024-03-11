from django.urls import path
from .views import VRegistro
from . import views

urlpatterns = [
    path('', VRegistro.as_view(), name="Autenticacion"), 
    path('cerrar_sesion', views.cerrar_sesion, name="cerrar_sesion"), 
    path('logear', views.logear, name="logear"), 
]
