import 'package:carrito_compra/PantallaCarta.dart';
import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 175, 48),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container( 
                  padding: EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    ),
                  ),
                  child: RotatedBox( 
                    quarterTurns: 3,
                    child: Padding( 
                      padding: EdgeInsets.only(top: 10),
                      child: Text("La mejor comida tipica", style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        letterSpacing: 5,
                        ),),
                    )
                  ),
                ),
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/img/img5.png',
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.red,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext) => PantallaCarta()
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