import 'package:flutter/material.dart';

class PantallaCarta extends StatefulWidget {

  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTA"),
      ),
      drawer: menuLateral(),
      body: Container(),
    );
  }
}
class menuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Bakelove"), 
            decoration: BoxDecoration(
              color:  const Color.fromARGB(255, 104, 160, 105)
            ),
            ),
            InkWell(
              child: new ListTile(
                title: Text("INICIO", style: TextStyle(color: const Color.fromARGB(255, 104, 160, 105)),),
                leading: Icon(Icons.home, color: const Color.fromARGB(255, 104, 160, 105),),
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext) => PantallaInicio()
                        )
                    );
              },
            ),
            InkWell(
              child: new ListTile(
                title: Text("Carta", style: TextStyle(color: const Color.fromARGB(255, 104, 160, 105)),),
                leading: Icon(Icons.airplay, color: const Color.fromARGB(255, 104, 160, 105),),
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext) => PantallaCarta()
                        )
                    );
              },
            ),
            InkWell(
              child: new ListTile(
                title: Text("CARRITO", style: TextStyle(color: const Color.fromARGB(255, 104, 160, 105)),),
                leading: Icon(Icons.add_shopping_cart, color: const Color.fromARGB(255, 104, 160, 105),),
              ),
              onTap: (){
                
              },
            ),
            InkWell(
              child: new ListTile(
                title: Text("INFO", style: TextStyle(color: const Color.fromARGB(255, 104, 160, 105)),),
                leading: Icon(Icons.account_box, color: const Color.fromARGB(255, 104, 160, 105),),
              ),
              onTap: (){
                
              },
            ),
        ],
      ),
    );
  }
}