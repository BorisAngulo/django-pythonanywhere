from django.shortcuts import render, HttpResponse
from carro.carro import Carro

# Create your views here.

def home(request):
    carro = Carro(request)#inicializamos el carro para que no haya error
    return render(request, "proyectoWebApp/home.html")




