import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CityTourApp());
}

class CityTourApp extends StatelessWidget {
  CityTourApp({super.key});

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
