import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inicializa Firebase antes de ejecutar la aplicación
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("FATAL ERROR: Falló la inicialización de Firebase: $e");
  }

  // Ahora sí, ejecuta la aplicación
  runApp(CityTourApp());
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
      home: HomeScreen(),
    );
  }
}
