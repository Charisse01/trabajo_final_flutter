import 'package:flutter/material.dart';

import 'pantallainicio.dart';

class PantallaCarta extends StatefulWidget {

  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
      appBar: AppBar(
        title: Text("CARTA"),
        backgroundColor: const Color.fromARGB(255, 104, 160, 105),
        elevation: 0,
        bottom: TabBar(
          labelColor: const Color.fromARGB(255, 63, 83, 94),
          indicatorColor: const Color.fromARGB(255, 63, 83, 94),
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
            )
          ],
          ),
      ),
      drawer: menuLateral(),
      body: TabBarView(
        children: <Widget>[
          Container( child: Text("PLATOS"),),
          Container( child: Text("BEBIDAS"),),
          Container( child: Text("POSTRES"),),
        ],
            
        
        ),
      ),
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
            accountEmail: Text(""),
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
                title: Text("CARTA", style: TextStyle(color: const Color.fromARGB(255, 104, 160, 105)),),
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