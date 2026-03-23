import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrito_compra/carrito/Carrito.dart';
import 'package:carrito_compra/PantallaInicio.dart';
import 'package:carrito_compra/PantallaCarta.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PantallaInicio(),
    );
  }
}*/
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Carrito(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant TIPIKA',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaInicio(),
        '/carta': (context) => PantallaCarta(),
      },
    );
  }
}


/*void main() => runApp(ChangeNotifierProvider(
  create: (context) => Carrito(),
  child: MyApp(),
  ),
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant TIPIKA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio(),
    );
  }
}*/