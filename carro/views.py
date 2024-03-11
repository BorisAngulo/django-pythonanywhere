from django.shortcuts import render
from tienda.models import Producto
from .carro import Carro
from django.shortcuts import redirect

# Create your views here.

def agregar_producto(request, producto_id):
    carro = Carro(request)
    producto = Producto.objects.get(id=producto_id)
    carro.agregar(producto=producto)
    return redirect('Tienda')#redirigimos a la pagina de la tienda

def eliminar_producto(request, producto_id):
    carro = Carro(request)
    producto = Producto.objects.get(id=producto_id)
    carro.eliminar(producto=producto)
    return redirect('Tienda')#redirigimos a la pagina de la tienda

def restar_producto(request, producto_id):
    carro = Carro(request)
    producto = Producto.objects.get(id=producto_id)
    carro.restar_producto(producto=producto)
    return redirect('Tienda')#redirigimos a la pagina de la tienda

def limpiar_carro(request):
    carro = Carro(request)
    carro.limpiar_carro()
    return redirect('Tienda')#redirigimos a la pagina de la tienda