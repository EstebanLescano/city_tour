import 'package:flutter/material.dart';
import 'package:city_tour/screens/second_screen.dart';
import 'package:city_tour/screens/third_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ... (App Bar y otras cosas)
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 7, 4, 150)),
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
                  MaterialPageRoute(builder: (context) => SecondRoute()),
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
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // ... (Resto del body con el botón 'Iniciar Tour')

      // Asegúrate de cambiar la navegación del botón 'Iniciar Tour'
      // a SecondRoute, si no lo has hecho ya.
    );
  }
}
