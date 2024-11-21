import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  @override
  State<PantallaInicio> createState() => _PantallaInicio();
}

class _PantallaInicio extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 83, 94),
      body: Container(
        child: Stack( 
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 15, left: 5, top: 50),
                  decoration: BoxDecoration(
                    color:  const Color.fromARGB(255, 104, 160, 105),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                    )
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                    child: Text("Los mejores postres veganos...", style: TextStyle(
                      color: const Color.fromARGB(255, 63, 83, 94),
                      fontStyle: FontStyle.italic, 
                      fontSize: 20,
                      letterSpacing: 5
                    ),),
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
                    backgroundColor: const Color.fromARGB(255, 104, 160, 105), // Correct property to set the background color
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,  // Icon color
                  ),
                  onPressed: () {
                    // Your action here
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
