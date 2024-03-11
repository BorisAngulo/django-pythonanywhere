from django.shortcuts import render
from servicios.models import Servicio

# Create your views here.
def servicios(request):
    servicios = Servicio.objects.all()#importamos todos los objetos de la base de datos
    return render(request, "servicios/servicios.html", {"servicios": servicios})#pasamos los objetos a la plantilla
