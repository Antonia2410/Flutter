class Item {
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;

Item({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad,
  });

    Item.fromMap(Map<String, dynamic> o)
      : id = o['id']?.toString() ?? '',
        nombre = o['nombre']?.toString() ?? '',
        precio = (o['precio'] is String)
            ? double.tryParse(o['precio']) ?? 0.0
            : (o['precio'] as num).toDouble(),
        unidad = o['unidad']?.toString() ?? '',
        imagen = o['imagen']?.toString() ?? '',
        cantidad = (o['cantidad'] is String)
            ? int.tryParse(o['cantidad']) ?? 0
            : (o['cantidad'] as int);


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    map['precio'] = precio;
    map['unidad'] = unidad;
    map['imagen'] = imagen;
    map['cantidad'] = cantidad;
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nombre'] = nombre;
    data['precio'] = precio;
    data['unidad'] = unidad;
    data['imagen'] = imagen;
    data['cantidad'] = cantidad;
    return data;
  }
}

