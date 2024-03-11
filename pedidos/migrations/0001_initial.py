# Generated by Django 5.0.2 on 2024-02-18 20:36

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('tienda', '0003_alter_producto_precio'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(max_length=100, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'pedido',
                'verbose_name_plural': 'pedidos',
                'db_table': 'pedidos',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='LineaPedido',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.IntegerField(default=1)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('producto_id', models.ForeignKey(max_length=100, on_delete=django.db.models.deletion.CASCADE, to='tienda.producto')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('pedido_id', models.ForeignKey(max_length=100, on_delete=django.db.models.deletion.CASCADE, to='pedidos.pedido')),
            ],
            options={
                'verbose_name': 'Linea Pedido',
                'verbose_name_plural': 'Lineas Pedidos',
                'db_table': 'lineapedidos',
                'ordering': ['id'],
            },
        ),
    ]
