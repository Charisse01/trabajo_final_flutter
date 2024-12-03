import 'package:flutter/material.dart';

class PantallaInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Acerca de la App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[700]!, Colors.cyan[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 120, 
                  height: 120, 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, 
                      width: 6,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10, 
                        offset: Offset(0, 4), 
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/bakelove.png', 
                      fit: BoxFit.contain, 
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              //info
              Text(
                "¡Bienvenido a Bakelove!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Bakelove es la app perfecta para realizar tus pedidos de comida. "
                "Explora nuestro menú, agrega productos al carrito y haz tu compra de manera rápida y segura.",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              SizedBox(height: 30),

              // sección de contacto
              Text(
                "Contáctanos para más información:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),

              // correo electrónico
              _buildContactCard(
                icon: Icons.email,
                text: "bakelovefast@gmail.com",
                onTap: () {
                },
              ),
              SizedBox(height: 20),

              // Teléfono
              _buildContactCard(
                icon: Icons.phone,
                text: "+1 (829) 527-8136",
                onTap: () {
                },
              ),
              SizedBox(height: 20),

              // Redes sociales
              _buildContactCard(
                icon: Icons.account_box,
                text: "@BakeloveRD_fast",
                onTap: () {
                },
              ),
              SizedBox(height: 30),

              Text(
                "¡Gracias por elegirnos! Estamos aquí para hacer tus pedidos más fáciles y rápidos.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para tarjetas de contacto
  Widget _buildContactCard({required IconData icon, required String text, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white.withOpacity(0.85),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(icon, color: Colors.teal, size: 30),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
