class Carta {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  const Carta(this.id, this.nombre, this.precio, this.imagen, this.descripcion);
}
final platos = [
  new Carta(1, 'Rocota relleno', 80.99, 'rocoto.png', 'Preparado.'),
  new Carta(2, 'Adobo', 6.99, 'adobo.png', 'Jugosa hamburguesa con queso y bacon.'),
  new Carta(3, 'Plalaya', 5.99, 'malaya.png', 'Ensalada fresca con aderezo de tu elección.'),
  new Carta(4, 'Chupe', 7.99, 'chupe.png', 'Pasta al dente con salsa de tomate casera.'),
];

final bebidas = [
  new Carta(5, 'Limonada', 2.99, 'limonada.png', 'Limonada casera con hielo.'),
  new Carta(6, 'Jugo', 3.99, 'jugo.png', 'Jugo de frutas frescas.'),
  new Carta(7, 'Chicha', 2.99, 'chicha.png', 'Chicha de maíz con hierbas.'),
];

final postres = [
  new Carta(8, 'Gelatina', 4.99, 'gelatina.png', 'Pastel de chocolate con salsa de fresa.'),
  new Carta(9, 'Yogurt', 3.99, 'yogurt.png', 'Yogurt de vainilla con frutas frescas.'),
  new Carta(10, 'Flan', 3.99, 'flan.png', 'Flan con caramelo y nuez moscada.'),
];
