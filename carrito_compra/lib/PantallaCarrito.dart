import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrito_compra/carrito/Carrito.dart';
class PantallaCarrito extends StatefulWidget {
  @override
  _PantallaCarritoState createState() => _PantallaCarritoState(); 
}
class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(
      builder: (context, carrito, child){
        return Scaffold(
          backgroundColor: Colors.amberAccent,
          appBar: AppBar(
            title: Text("PEDIDOS"),
            elevation: 0,
            backgroundColor: Colors.amberAccent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.red,),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ),
          body: Container(
            child: carrito.items.length == 0
                ? Center(
                  child: Text("El carrito está vacío"),)
                : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (var item in carrito.items.values) 
                        Card(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset("assets/img/"+item.imagen, width: 150, height: 150,),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: 150,
                                  child: Column(                                    
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item.nombre, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text("S/." + item.precio.toString() + " x " + item.unidad.toString(), style: TextStyle(fontSize: 18, color: Colors.grey),),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            child: IconButton(
                                              icon: Icon(Icons.remove, size: 13, color: Colors.white,),
                                              onPressed: (){
                                                setState(() {
                                                carrito.decrementarCantidadItem(item.id);                                                 
                                                });
                                              },
                                            ),
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                          ),
                                          Container(
                                            width: 20,
                                            child: Center(child: Text(item.cantidad.toString(), style: TextStyle(fontSize: 18),),),
                                          ),
                                          Container(
                                            child: IconButton(
                                              icon: Icon(Icons.add, size: 13, color: Colors.white,),
                                              onPressed: (){
                                                setState(() {
                                                carrito.incrementarCantidadItem(item.id);                                                 
                                                });
                                              },
                                            ),
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(30)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 214, 213),
                                ),
                                child: Center(
                                  child: Text("S/." + (item.precio * item.cantidad).toString(), style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("SubTotal: "),
                            ),
                            Text("S/." + carrito.subTotal.toString(),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:  Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("Impuesto: "),
                            ),
                            Text("S/." + carrito.impuesto.toStringAsFixed(2),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child:  Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("Total: "),
                            ),
                            Text("S/." + carrito.Total.toStringAsFixed(2), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      /*Row(
                        children: <Widget>[
                          Text("Impuesto: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("S/." + carrito.impuesto.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Total: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("S/." + carrito.Total.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),*/
                      SizedBox(height: 80)
                    ],
                  ),
                )  
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              String pedido = "";
              carrito.items.forEach((key, value) {
                pedido = '$pedido' + value.nombre + " CANTIDAD: " + value.cantidad.toString() + " PRECIO UNITARIO: " + value.precio.toString() + " PRECIO TOTAL: " + (value.precio * value.cantidad).toStringAsFixed(2) + "\n";
              });
              pedido = '$pedido' + "SUBTOTAL: " + carrito.subTotal.toStringAsFixed(2) + "\n";
              pedido = '$pedido' + "IMPUESTO: " + carrito.impuesto.toStringAsFixed(2) + "\n";
              pedido = '$pedido' + "TOTAL: " + carrito.Total.toStringAsFixed(2) + "\n";
              print(pedido);
            },
            child: Icon(Icons.send, color: Colors.amberAccent,),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }
}