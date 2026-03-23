import 'package:flutter/material.dart';
class PantallaRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("RESTAURANT"),
        backgroundColor: Colors.amberAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del restaurante
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/img/restaurant.png", 
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Nombre y descripción
            Text(
              "TIPIKA Restaurant",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "La mejor comida típica de la región, con recetas tradicionales y un ambiente acogedor.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Dirección
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text("Calle Principal #123, Huajuapan de León, Oaxaca"),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Horarios
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text("Lunes a Domingo: 9:00 AM - 10:00 PM"),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Teléfono
            Row(
              children: [
                Icon(Icons.phone, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text("+52 953 123 4567"),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Botón de contacto
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Llamando al restaurante...")),
                  );
                },
                icon: Icon(Icons.call, color: Colors.white),
                label: Text("Contactar", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
