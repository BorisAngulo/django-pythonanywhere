from django.contrib import admin
from .models import Producto, CategoriaProd

# Register your models here.
class CategoriaProdAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')

class ProductoAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')

admin.site.register(Producto, ProductoAdmin)
admin.site.register(CategoriaProd, CategoriaProdAdmin)
