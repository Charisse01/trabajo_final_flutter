import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/model/Item.dart';

class Carrito extends ChangeNotifier {
  Map<String, Item> _items = {};

  Map<String, Item> get items {
    return {..._items}; 
  }

  int get numeroItems {
    return _items.length;
  }

  double get subTotal {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.precio * item.cantidad;
    });
    return total;
  }

  double get impuesto {
    return subTotal * 0.18;
  }

  double get total {
    return subTotal * 1.18;
  }

  void agregarItems(
    String productoId,
    String nombre,
    double precio,
    String unidad,
    String imagen,
    int cantidad,
  ) {
    if (_items.containsKey(productoId)) {
      _items.update(
        productoId,
        (oldItem) => Item(
          id: oldItem.id,
          nombre: oldItem.nombre,
          precio: oldItem.precio,
          unidad: oldItem.unidad,
          imagen: oldItem.imagen,
          cantidad: oldItem.cantidad + cantidad,  
        ),
      );
    } else {
      _items.putIfAbsent(
        productoId,
        () => Item(
          id: productoId,
          nombre: nombre,
          precio: precio,
          unidad: unidad,
          imagen: imagen,
          cantidad: cantidad,
        ),
      );
    }
    notifyListeners();  
  }

  void removerItem(String productoId) {
    _items.remove(productoId);
    notifyListeners();  
  }

  void incrementarCantidadItem(String productoId) {
    if (_items.containsKey(productoId)) {
      _items.update(
        productoId,
        (oldItem) => Item(
          id: oldItem.id,
          nombre: oldItem.nombre,
          precio: oldItem.precio,
          unidad: oldItem.unidad,
          imagen: oldItem.imagen,
          cantidad: oldItem.cantidad + 1,
        ),
      );
      notifyListeners();  
    }
  }

  void decrementarCantidadItem(String productoId) {
    if (!_items.containsKey(productoId)) return;
    if (_items[productoId]!.cantidad > 1) {
      _items.update(
        productoId,
        (oldItem) => Item(
          id: oldItem.id,
          nombre: oldItem.nombre,
          precio: oldItem.precio,
          unidad: oldItem.unidad,
          imagen: oldItem.imagen,
          cantidad: oldItem.cantidad - 1,
        ),
      );
      notifyListeners();  
    } else {
      _items.remove(productoId);
      notifyListeners();  
    }
  }

  void removeCarrito() {
    _items.clear();  
    notifyListeners();  
  }
}
