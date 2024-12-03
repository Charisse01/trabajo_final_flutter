import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/carrito/Carrito.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
            elevation: 5,
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
          body: carrito.items.isEmpty
              ? Center(child: Text("Carrito Vacío", style: TextStyle(fontSize: 18, color: Colors.grey)))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      //* Lista de productos
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: carrito.items.length,
                        itemBuilder: (context, index) {
                          var item = carrito.items.values.elementAt(index);
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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

                                  //* Precio total del producto
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

                      //* Contenedor para el resumen (subtotal, impuesto y total)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //* Subtotal
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal:",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Text(
                                    "S/. ${carrito.subTotal.toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              //* Impuesto
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Impuesto (18%):",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Text(
                                    "S/. ${carrito.impuesto.toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              //* Total
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total:",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  Text(
                                    "S/. ${carrito.total.toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
          //* Botón de Enviar Pedido
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop, 
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 20, top: 30), 
            child: GestureDetector(
              onTap: () async {
                String pedido = "";
                carrito.items.forEach((key, value) {
                  pedido = pedido + 
                  value.nombre + 
                  "\nCANTIDAD: " + 
                  value.cantidad.toString() +
                  "\nPRECIO UNITARIO: " + 
                  value.precio.toString() +
                  "\nPRECIO TOTAL: " + 
                  (value.cantidad * value.precio).toStringAsFixed(2) +
                  "\n*****************************************\n";
                });
                
                pedido = '$pedido' + "SUBTOTAL: " + carrito.subTotal.toStringAsFixed(2) + "\n";
                pedido = '$pedido' + "IMPUESTO: " + carrito.impuesto.toStringAsFixed(2) + "\n";
                pedido = '$pedido' + "TOTAL: " + carrito.total.toStringAsFixed(2) + "\n";

                //* Vincular a WhatsApp
                String cell = "+18295278136";  
                String mensaje = Uri.encodeComponent(pedido);  // Codificar el mensaje
                String url = "https://wa.me/$cell?text=$mensaje";  // Formato para WhatsApp

                // Comprobar si se puede lanzar la URL
                if (await canLaunch(url)) {
                  await launch(url);  // Lanzar la URL
                } else {
                  throw('No se pudo enviar mensaje por WhatsApp');
                }
          
                //* Mostrar el mensaje del pedido en una ventana emergente
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Resumen de Pedido"),
                    content: Text(pedido),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          "Cerrar",
                          style: TextStyle(color: Colors.teal),  
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal[400]!, Colors.teal[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(Icons.send, color: Colors.white, size: 30),  
              ),
            ),
          ),
        );
      },
    );
  }
}
