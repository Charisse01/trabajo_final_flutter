import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/pantallaCarrito.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_pedidos/carrito/Carrito.dart';
import 'package:flutter_app_pedidos/model/Carta.dart';
import 'package:flutter_app_pedidos/pantallainicio.dart';

class PantallaCarta extends StatefulWidget {
  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("CARTA"),
            backgroundColor: Colors.teal, // Usamos el color teal
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.white, // Color de la etiqueta
              indicatorColor: Colors.white, // Indicador del tab
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("PLATOS"),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("BEBIDAS"),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("POSTRES"),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              new Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Verifica si el carrito tiene items
                      if (carrito.numeroItems != 0) {
                        // Si tiene items, navega a la pantalla del carrito
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PantallaCarrito(),
                          ),
                        );
                      } else {
                        // Si no tiene items, muestra el SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Llenar el carrito",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              new Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.teal, // Fondo del contador de items
                    borderRadius: BorderRadius.circular(4),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 15,
                    minHeight: 14,
                  ),
                  child: Text(
                    carrito.numeroItems.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: menuLateral(),
          body: TabBarView(
            children: <Widget>[
              // Platos Tab
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.teal.withOpacity(0.1), // Fondo con opacidad suave
                child: GridView.builder(
                  itemCount: platos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/" + platos[index].imagen,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            platos[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "S/." + platos[index].precio.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItems(
                                  platos[index].id.toString(),
                                  platos[index].nombre,
                                  platos[index].precio,
                                  "1",
                                  platos[index].imagen,
                                  1,
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              backgroundColor: Colors.teal, // Botón con color teal
                              foregroundColor: Colors.white,
                            ),
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text("Agregar"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Bebidas Tab
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.teal.withOpacity(0.1),
                child: GridView.builder(
                  itemCount: bebidas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/" + bebidas[index].imagen,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            bebidas[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "S/." + bebidas[index].precio.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItems(
                                  bebidas[index].id.toString(),
                                  bebidas[index].nombre,
                                  bebidas[index].precio,
                                  "1",
                                  bebidas[index].imagen,
                                  1,
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              backgroundColor: Colors.teal, // Botón con color teal
                              foregroundColor: Colors.white,
                            ),
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text("Agregar"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Postres Tab
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.teal.withOpacity(0.1),
                child: GridView.builder(
                  itemCount: postres.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x000005cc),
                            blurRadius: 30,
                            offset: Offset(10, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/" + postres[index].imagen,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            postres[index].nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "S/." + postres[index].precio.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                carrito.agregarItems(
                                  postres[index].id.toString(),
                                  postres[index].nombre,
                                  postres[index].precio,
                                  "1",
                                  postres[index].imagen,
                                  1,
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              backgroundColor: Colors.teal, // Botón con color teal
                              foregroundColor: Colors.white,
                            ),
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text("Agregar"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class menuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Bakelove"),
            accountEmail: Text(""),
            decoration: BoxDecoration(
              color: Colors.teal, // Fondo del header
            ),
          ),
          InkWell(
            child: new ListTile(
              title: Text(
                "INICIO",
                style: TextStyle(color: Colors.teal),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.teal,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext) => PantallaInicio(),
                ),
              );
            },
          ),
          InkWell(
            child: new ListTile(
              title: Text(
                "CARTA",
                style: TextStyle(color: Colors.teal),
              ),
              leading: Icon(
                Icons.airplay,
                color: Colors.teal,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext) => PantallaCarta(),
                ),
              );
            },
          ),
          InkWell(
            child: new ListTile(
              title: Text(
                "CARRITO",
                style: TextStyle(color: Colors.teal),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.teal,
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: new ListTile(
              title: Text(
                "INFO",
                style: TextStyle(color: Colors.teal),
              ),
              leading: Icon(
                Icons.account_box,
                color: Colors.teal,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
