from django.urls import path
from . import views

app_name="carro"#indicamos que este es el archivo de urls de la app carro

urlpatterns = [
    path("", views.procesar_pedido, name="procesar_pedido"),
    
]
