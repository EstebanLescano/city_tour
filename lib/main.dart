import 'package:flutter/material.dart';

void main() {
  runApp(const CityTourApp());
}

class CityTourApp extends StatelessWidget {
  const CityTourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CITY TOUR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // MyHomePage debe estar definido aquí o importado.
      home: const MyHomePage(title: 'CITY TOUR'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // ⭐ Constructor MyHomePage: Añadir 'const'
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const String backgroundImageUrl = 'assets/background.jpg';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 10, 65, 110),
      ),
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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Texto arriba a la izquierda
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              '¡Bienvenido a MCT!',
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ),

          // Botón arriba a la derecha
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Replace with your navigation logic or desired action
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 29, 156, 175),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Iniciar Tour',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
