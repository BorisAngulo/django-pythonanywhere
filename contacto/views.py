from django.shortcuts import render, redirect
from .forms import FormularioContacto #importamos el formulario creado en forms.py
from django.core.mail import EmailMessage #importamos la libreria para enviar correos

# Create your views here.

def contacto(request):
    formulario_contacto = FormularioContacto()

    if request.method == "POST":
        formulario_contacto = FormularioContacto(data=request.POST)#metemos la informacion de los cuadros al formulario
        if formulario_contacto.is_valid():
            nombre = request.POST.get('nombre')
            email = request.POST.get('email')
            contenido = request.POST.get('contenido')

            email = EmailMessage("Mensaje desde App Django", 
                                 "El usuario con nombre {} con la direccion {} escribe lo siguiente:\n\n{}".format(nombre, email, contenido),
                                 "", ["borisanthony03@gmail.com"], reply_to=[email])
            #despues del format tenemos el correo al que se enviara el mensaje, el correo que enviara el mensaje, y el correo al que se respondera
            try:
                email.send()
                return redirect("/contacto/?valido")#redirigimos a la misma pagina con un mensaje de exito
            except:
                return redirect("/contacto/?novalido")#redirigimos a la misma pagina con un mensaje de error

    return render(request, "contacto/contacto.html", {'miFormulario': formulario_contacto})