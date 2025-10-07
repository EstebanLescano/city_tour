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

//           // Botón arriba a la derecha
//           Positioned(
//             top: 50,
//             right: 20,
//             child: ElevatedButton(
//               onPressed: () {
//                 // TODO: Replace with your navigation logic or desired action
//                 // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 29, 156, 175),
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   right: 10,
//                   top: 5,
//                   bottom: 5,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text(
//                 'Iniciar Tour',
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
