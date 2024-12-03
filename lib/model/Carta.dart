class Carta {
  final int id;
  final String nombre;
  final double precio; 
  final String imagen; 
  final String description;

  const Carta({
    required this.id, 
    required this.nombre, 
    required this.precio, 
    required this.imagen, 
    required this.description,
  });
}

final platos = [
  const Carta(id: 1, nombre: "Arroz con Verduras", precio: 130.00, imagen: "arrozverduras.jpg", description: "Preparado ......"),
  const Carta(id: 2, nombre: "Ensalada de Espirales", precio: 240.00, imagen: "ensaladaespirales.jpg", description: "Preparado ......"),
  const Carta(id: 3, nombre: "Espaguetis al ajillo", precio: 370.00, imagen: "espaguetisajillo.jpg", description: "Preparado ......"),
  const Carta(id: 4, nombre: "Albondigas", precio: 270.00, imagen: "albondigas.jpg", description: "Preparado ......"),
  const Carta(id: 5, nombre: "Ensalada de Quinoa", precio: 355.00, imagen: "ensaladaquinoa.jpg", description: "Preparado ......"),
  const Carta(id: 6, nombre: "Dedos de Tofu", precio: 250.00, imagen: "dedostofu.jpg", description: "Preparado ......"),
];

final bebidas = [
  const Carta(id: 7, nombre: "Smoothie de Sandia", precio: 140.00, imagen: "smoothiesandia.jpg", description: "Preparado ......"),
  const Carta(id: 8, nombre: "Batido de Espinacas", precio: 115.00, imagen: "batidoespinaca.jpg", description: "Preparado ......"),
  const Carta(id: 9, nombre: "Smoothie de Zanahoria", precio: 150.00, imagen: "smoothiezanahoria.jpg", description: "Preparado ......"),
  const Carta(id: 10, nombre: "Cocktail de Frutas", precio: 190.00, imagen: "cocktailfruta.jpg", description: "Preparado ......"),
  const Carta(id: 11, nombre: "Milkshake de Chocolate", precio: 130.00, imagen: "milkshakechocolate.jpg", description: "Preparado ......"),


];

final postres = [
  const Carta(id: 12, nombre: "Pudding de Chía", precio: 195.00, imagen: "puddinchia.jpg", description: "Preparado ......"),
  const Carta(id: 13, nombre: "Helado", precio: 165.00, imagen: "helado.jpg", description: "Preparado ......"),
  const Carta(id: 14, nombre: "Galletas de Platano", precio: 115.00, imagen: "galletasplatano.jpg", description: "Preparado ......"),
  const Carta(id: 15, nombre: "Mousse", precio: 125.00, imagen: "mousse.jpg", description: "Preparado ......"),
  const Carta(id: 16, nombre: "Panecillo de Almendra", precio: 115.00, imagen: "panecilloalmendra.jpg", description: "Preparado ......"),

];
