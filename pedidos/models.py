from django.db import models
from django.contrib.auth import get_user_model
from tienda.models import Producto
from django.db.models import F, Sum, FloatField
# Create your models here.

User=get_user_model()

class Pedido(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'pedidos'
        verbose_name = 'pedido'
        verbose_name_plural = 'pedidos'
        ordering = ['id']
    
    @property#nos permite acceder a los datos de la base de datos
    def total(self):
        
        return self.lineapedido_set.aggregate(
            total=Sum(F("precio")*F("cantidad"), output_field = FloatField())
        )["total"]

    def __str__(self):
        return self.id
    
class LineaPedido(models.Model):

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, max_length=100)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, max_length=100)
    cantidad = models.IntegerField(default = 1)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.cantidad} unidades de {self.producto.nombre}'
    
    class Meta:
        db_table = 'lineapedidos'
        verbose_name = 'Linea Pedido'
        verbose_name_plural = 'Lineas Pedidos'
        ordering = ['id']