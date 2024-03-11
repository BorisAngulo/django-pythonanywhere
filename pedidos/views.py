from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Pedido, LineaPedido
from carro.carro import Carro
from django.contrib import messages
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.core.mail import send_mail

# Create your views here.
@login_required(login_url="/autenticacion/logear")#decorador que nos permite verificar si el usuario esta logeado
def procesar_pedido(request):
    pedido = Pedido.objects.create(user=request.user)#creamos un pedido
    carro=Carro(request)#instanciamos el carro
    lineas_pedido = list()#creamos una lista
    for key, value in carro.carro.items():#recorremos el carro
        lineas_pedido.append(
            LineaPedido(
                user=request.user,
                producto_id=key,
                pedido = pedido,
                cantidad=value["cantidad"]
            )
        )

    LineaPedido.objects.bulk_create(lineas_pedido)#creamos las lineas de pedido
    '''el bulk_create hace varios into en una sola consulta, es mas eficiente que hacerlo uno por uno'''
    enviar_mail(pedido=pedido,
                lineas_pedido = lineas_pedido,
                nombreusuario = request.user.username,
                emailusuario = request.user.email)

    messages.success(request, f'Pedido n° {pedido.id} procesado exitosamente')
    return redirect('../tienda')


def enviar_mail(**kwargs):
    asunto = "Gracias por el pedido"
    mensaje= render_to_string("emails/pedido.html", {
        "pedido": kwargs.get("pedido"),
        "lineas_pedido": kwargs.get("lineas_pedido"),
        "nombreusuario": kwargs.get("nombreusuario"),
    })

    mensaje_texto = strip_tags(mensaje)#obtenemos el texto del mensaje omitiendo las etiquetas html
    from_email = "borisanthony03@gmail.com"#correo de donde se envia
    #to=kwargs.get("emailusuario")#correo a donde se enviara
    to="soloyoelborny@gmail.com"
    send_mail(asunto, mensaje_texto, from_email, [to], html_message=mensaje)#enviamos el correo