import 'package:flutter/material.dart';
import 'package:flutter_app_pedidos/model/Carta.dart';

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
          Container( 
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: platos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.2),
                crossAxisSpacing: 10,
                mainAxisSpacing: 2
                ), 
              itemBuilder: (context, index){
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
                        offset: Offset(10, 10)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget> [
                      Image.asset("assets/img/"+platos[index].imagen,
                      width: 170,   // Establecer un ancho fijo
                      height: 170,  // Establecer una altura fija
                      fit: BoxFit.cover),

                      Text(platos[index].nombre, style: TextStyle( fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("S/."+platos[index].precio.toString(), style: TextStyle( fontSize: 15)),                        
                        )                      
                    ],
                  ),
                );
              }              
              ),
          ),


          Container( 
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: bebidas.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.2),
                crossAxisSpacing: 10,
                mainAxisSpacing: 2
                ), 
              itemBuilder: (context, index){
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
                        offset: Offset(10, 10)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget> [
                      Image.asset("assets/img/"+bebidas[index].imagen,
                      width: 170,   // Establecer un ancho fijo
                      height: 170,  // Establecer una altura fija
                      fit: BoxFit.cover),

                      Text(bebidas[index].nombre, style: TextStyle( fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("S/."+bebidas[index].precio.toString(), style: TextStyle( fontSize: 15)),                       
                        ) 
                    ],
                  ),
                );
              }              
            ),
          ),
          


          Container( padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: postres.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.2),
                crossAxisSpacing: 10,
                mainAxisSpacing: 2
                ), 
              itemBuilder: (context, index){
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
                        offset: Offset(10, 10)
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget> [
                      Image.asset("assets/img/"+postres[index].imagen,
                      width: 160,   // Establecer un ancho fijo
                      height: 160,  // Establecer una altura fija
                      fit: BoxFit.cover),

                      Text(postres[index].nombre, style: TextStyle( fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("S/."+postres[index].precio.toString(), style: TextStyle( fontSize: 15)),
                        )
                    ],
                  ),
                );
              }              
              ),
          ),
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