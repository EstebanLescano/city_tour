import 'package:flutter/material.dart';
import 'package:city_tour/screens/tour_list_screen.dart';
import 'package:city_tour/screens/about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ... (App Bar y otras cosas)
    return Scaffold(
      appBar: AppBar(
        // ⭐ AGREGAR UN APPBAR
        title: const Text('CITY TOUR'),
        backgroundColor: const Color.fromARGB(255, 103, 231, 80),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Color del ícono del drawer
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 218, 45),
              ),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            // ⭐ Conectar el botón del tour a la segunda pantalla (Lista)
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Iniciar Tour'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TourListScreen()),
                );
              },
            ),

            // ⭐ Conectar 'Acerca de' a la TERCERA PANTALLA
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand, // Esto hace que el Stack ocupe todo el espacio
        children: <Widget>[
          // 1. EL FONDO (Background)
          Image.asset('assets/background.jpg', fit: BoxFit.cover),
          Positioned(
            // 2. EL BOTÓN (Button)
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TourListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Iniciar Tour'),
            ),
          ),
        ],
      ),
    );
  }
}
