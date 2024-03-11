from django.urls import path
from proyectoWebApp import views
from django.conf import settings
from django.conf.urls.static import static#importamos estos dos para poder mostrar las imagenes

urlpatterns = [
    path('', views.home, name="Home"),
]

#urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)#con esta linea de codigo le decimos a django que muestre las imagenes