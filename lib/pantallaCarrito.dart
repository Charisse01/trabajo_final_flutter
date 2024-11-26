import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/carrito/Carrito.dart';
import 'package:provider/provider.dart';

class PantallaCarrito extends StatefulWidget {
  @override
  _PantallaCarritoState createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(
      builder: (context, carrito, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Carrito de Pedidos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            elevation: 0,
            backgroundColor: Colors.teal,
          ),
          body: carrito.items.isEmpty
              ? Center(child: Text("Carrito Vacío", style: TextStyle(fontSize: 18, color: Colors.grey)))
              : ListView.builder(
                  itemCount: carrito.items.length,
                  itemBuilder: (context, index) {
                    var item = carrito.items.values.elementAt(index);
                    return Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Imagen del producto
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/img/" + item.imagen,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            // Descripción del producto y cantidad
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(item.nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(
                                    "S/. ${item.precio.toString()} × ${item.unidad}",
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(height: 10),
                                  // Botones de incrementar y decrementar
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      // Botón de decremento
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            carrito.decrementarCantidadItem(item.id);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      // Texto de cantidad
                                      Container(
                                        width: 40,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.teal.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          item.cantidad.toString(),
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      // Botón de incremento
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            carrito.incrementarCantidadItem(item.id);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Precio total del producto
                            Container(
                              height: 100,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal.withOpacity(0.1),
                              ),
                              child: Text(
                                "S/. ${(item.precio * item.cantidad).toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
