from django import forms
#para mas info buscar en google django forms y django form rendering
class FormularioContacto(forms.Form):

    nombre = forms.CharField(label='Nombre', max_length=100, required=True)
    email = forms.EmailField(label='Email', max_length=100, required=True)
    contenido = forms.CharField(label='Contenido', max_length=1000, widget=forms.Textarea(attrs={'rows': 6, 'cols': 40}), required=True)
