import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/carrito/Carrito.dart';
import 'package:flutter_app_pedidos/pantallainicio.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => Carrito(),
    child: MyApp(),
    )
);

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakelove',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio()
    );
  }
}
