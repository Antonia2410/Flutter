import 'package:carrito_compra/carrito/Carrito.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrito_compra/PantallaInicio.dart';
import 'package:carrito_compra/model/carta.dart';
import 'package:carrito_compra/PantallaCarrito.dart';

class PantallaCarta extends StatefulWidget {
  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>(); 
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(
      builder: (context, carrito, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            key: _globalKey,
            backgroundColor: const Color.fromARGB(255, 250, 175, 48),
            appBar: AppBar(
              title: Text("CARTA"),
              backgroundColor: const Color.fromARGB(255, 250, 175, 48),
              elevation: 0,
              bottom: TabBar(
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  new Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text("PLATOS", style: TextStyle(color: Colors.red),),
                    ),
                  ),
                  new Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text("BEBIDAS", style: TextStyle(color: Colors.red),),
                    ),
                  ),
                  new Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text("POSTRES", style: TextStyle(color: Colors.red),),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                new Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white,),
                      onPressed: () {
                        /*final mensaje = carrito.numeroItems != 0 
                          ? "Ir a carrito"
                          : "Llennar carrito";
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(mensaje, 
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),),),
                            duration: Duration(seconds: 2),
                            action: carrito.numeroItems != 0
                                ? SnackBarAction(
                                    label: "Ver carrito",
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/carrito');
                                    },
                                  )
                                : null,
                          ),
                        );*/
                        carrito.numeroItems != 0 
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => PantallaCarrito()))
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                  child: Text("Llennar carrito", 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),),),
                                duration: Duration(seconds: 2),
                              ),
                            );
                      },
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),),
                          constraints: BoxConstraints(
                            minWidth: 10,
                            minHeight: 10,
                          ),
                        child: Text(
                            carrito.numeroItems.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            drawer: MenuLateral(),
            body: TabBarView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount: platos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.5),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Image.asset("assets/img/"+platos[index].imagen, width: 210, height: 200,),
                            //Image.asset("assets/img/"+platos[index].imagen,width: double.infinity,height: 150,fit: BoxFit.cover,),
                            Image.asset("assets/img/${platos[index].imagen}",fit: BoxFit.cover,width: 350,height: 300,),
                            Text(platos[index].nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("\$"+platos[index].precio.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            Consumer<Carrito>(
                              builder: (context, carrito, child) {
                                return ElevatedButton.icon(
                                  onPressed: () {
                                    carrito.agregarItem(
                                      platos[index].id.toString(),
                                      platos[index].nombre,
                                      platos[index].precio,
                                      "1 unidad",
                                      platos[index].imagen,
                                      1,
                                    );
                                  },
                                  icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
                                  label: Text("Agregar al carrito", style: TextStyle(color: Colors.red),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amberAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                    child: GridView.builder(
                      itemCount: bebidas.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.5),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //Image.asset("assets/img/"+platos[index].imagen, width: 210, height: 200,),
                              //Image.asset("assets/img/"+platos[index].imagen,width: double.infinity,height: 150,fit: BoxFit.cover,),
                              Image.asset("assets/img/${bebidas[index].imagen}",fit: BoxFit.cover,width: 350,height: 300,),
                              Text(bebidas[index].nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("\$"+bebidas[index].precio.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ),
                              Consumer<Carrito>(
                                builder: (context, carrito, child) {
                                  return ElevatedButton.icon(
                                    onPressed: () {
                                      carrito.agregarItem(
                                        bebidas[index].id.toString(),
                                        bebidas[index].nombre,
                                        bebidas[index].precio,
                                        "1 unidad",
                                        bebidas[index].imagen,
                                        1,
                                      );
                                    },
                                    icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
                                    label: Text("Agregar al carrito", style: TextStyle(color: Colors.red),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amberAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount: postres.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.5),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/img/${postres[index].imagen}",fit: BoxFit.cover,width: 350,height: 300,),
                            Text(postres[index].nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("\$"+postres[index].precio.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            Consumer<Carrito>(
                              builder: (context, carrito, child) {
                                return ElevatedButton.icon(
                                  onPressed: () {
                                    carrito.agregarItem(
                                      postres[index].id.toString(),
                                      postres[index].nombre,
                                      postres[index].precio,
                                      "1 unidad",
                                      postres[index].imagen,
                                      1,
                                    );
                                  },
                                  icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
                                  label: Text("Agregar al carrito", style: TextStyle(color: Colors.red),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amberAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 

class MenuLateral extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("TIPIKA Restaurant"),
              accountEmail: Text("info@tipika.com"),
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 250, 175, 48),
              ),
            ),
            InkWell(
              child: new ListTile(
                title: new Text("INICIO", style: TextStyle(color: const Color.fromARGB(255, 250, 175, 48)),),
                leading: Icon(Icons.home, color: const Color.fromARGB(255, 250, 175, 48)),
              ),
              onTap:(){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => PantallaInicio()
                  ),
                );
              },
              /*onTap: () {
                Navigator.pushReplacementNamed(context, '/carta');
              }*/

            ),
            InkWell(
              child: new ListTile(
                title: new Text("CARTA", style: TextStyle(color: const Color.fromARGB(255, 250, 175, 48)),),
                leading: Icon(Icons.article, color: const Color.fromARGB(255, 250, 175, 48)),
              ),
              onTap:(){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext) => PantallaCarta()
                  ),
                );
              },
            ),
            InkWell(
              child: new ListTile(
                title: new Text("CARRITO", style: TextStyle(color: const Color.fromARGB(255, 250, 175, 48)),),
                leading: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 250, 175, 48)),
              ),
              onTap:(){
              },
            ),
            InkWell(
              child: new ListTile(
                title: new Text("RESTAURANT", style: TextStyle(color: const Color.fromARGB(255, 250, 175, 48)),),
                leading: Icon(Icons.restaurant, color: const Color.fromARGB(255, 250, 175, 48)),
              ),
              onTap:(){;
              },
            ),
          ],
        ),
      );
    }
  }