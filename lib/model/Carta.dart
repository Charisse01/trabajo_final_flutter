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
  const Carta(id: 1, nombre: "pastel", precio: 90.00, imagen: "pastel.jpg", description: "Preparado ......"),
  const Carta(id: 2, nombre: "macarons", precio: 70.00, imagen: "macarons.jpg", description: "Preparado ......"),
  const Carta(id: 3, nombre: "helado", precio: 85.00, imagen: "helado.jpg", description: "Preparado ......"),
  const Carta(id: 4, nombre: "pie", precio: 69.00, imagen: "pie.jpg", description: "Preparado ......"),
];

final bebidas = [
  const Carta(id: 5, nombre: "batida", precio: 100.00, imagen: "batida.jpg", description: "Preparado ......"),
  const Carta(id: 6, nombre: "nuruddin", precio: 250.00, imagen: "nuruddin.jpg", description: "Preparado ......"),
  const Carta(id: 7, nombre: "pudin", precio: 99.00, imagen: "pudin.jpg", description: "Preparado ......"),
];

final postres = [
  const Carta(id: 9, nombre: "biscocho", precio: 90.00, imagen: "biscocho.jpg", description: "Preparado ......"),
  const Carta(id: 10, nombre: "paqueis", precio: 70.00, imagen: "paqueis.jpg", description: "Preparado ......"),
  const Carta(id: 11, nombre: "browni", precio: 85.00, imagen: "browni.jpg", description: "Preparado ......"),
  const Carta(id: 12, nombre: "galletas", precio: 69.00, imagen: "galletas.jpg", description: "Preparado ......"),
  const Carta(id: 12, nombre: "galletas", precio: 69.00, imagen: "galletas.jpg", description: "Preparado ......"),
  const Carta(id: 12, nombre: "galletas", precio: 69.00, imagen: "galletas.jpg", description: "Preparado ......"),

];
