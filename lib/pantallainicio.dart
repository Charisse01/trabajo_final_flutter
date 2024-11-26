import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/pantallaCarta.dart';

class PantallaInicio extends StatefulWidget {
  @override
  State<PantallaInicio> createState() => _PantallaInicio();
}

class _PantallaInicio extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.1), // Fondo con opacidad
      body: Container(
        child: Stack( 
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 15, left: 5, top: 50),
                  decoration: BoxDecoration(
                    color: Colors.teal, // Color de fondo para esta sección
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    ),
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Los mejores postres veganos...",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic, 
                          fontSize: 20,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/img/bakelove.png", 
                    width: MediaQuery.of(context).size.width / 2,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(13.0),
                    backgroundColor: Colors.teal, // Color de fondo para el botón
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,  // Color del ícono
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext) => PantallaCarta(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
