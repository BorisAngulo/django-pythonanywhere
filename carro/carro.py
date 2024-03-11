class Carro:
    def __init__(self, request):
        self.request = request
        self.session = request.session#obtenemos la sesion actual
        carro = self.session.get('carro')#obtenemos el carro de la sesion
        if not carro:#si no hay carro en la sesion
            carro = self.session['carro'] = {}
        #else:
        self.carro = carro
    
    def agregar(self, producto):
        if str(producto.id) not in self.carro.keys():#si el producto no esta en el carro
            self.carro[producto.id] = {
                "producto_id": producto.id,
                "nombre": producto.nombre,
                "precio": str(producto.precio),
                "cantidad": 1,
                "imagen": producto.imagen.url
            }
        else:
            for key, value in self.carro.items():#si el producto ya esta en el carro
                if key == str(producto.id):
                    value["cantidad"] = value["cantidad"] + 1
                    value["precio"] = float(value["precio"]) + producto.precio
                    break
        
        self.guardar()#guardamos el carro en la sesion

    def guardar(self):#guardamos el carro en la sesion
        self.session['carro'] = self.carro
        self.session.modified = True#indicamos que la sesion ha sido modificada
    
    def eliminar(self, producto):
        producto_id = str(producto.id)
        if producto_id in self.carro:
            del self.carro[producto_id]#eliminamos el producto del carro
            self.guardar()#guardamos el carro en la sesion

    def restar_producto(self, producto):
        for key, value in self.carro.items():
            if key == str(producto.id):
                value["cantidad"] = value["cantidad"] - 1
                value["precio"] = float(value["precio"]) - producto.precio
                if value["cantidad"] < 1:
                    self.eliminar(producto)
                break
        self.guardar()
    
    def limpiar_carro(self):
        self.session['carro'] = {}
        self.session.modified = True
