import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/pantallainicio.dart';

void main() => runApp(MyApp());

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
