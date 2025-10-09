import 'package:flutter/material.dart';
import 'package:city_tour/screens/tour_detail_screen.dart';

// El widget debe ser StatelessWidget porque solo muestra datos que recibe.
class TourDayCard extends StatelessWidget {
  final Map<String, dynamic> tourDay;

  const TourDayCard({super.key, required this.tourDay});

  @override
  Widget build(BuildContext context) {
    final dynamic imageUrl = tourDay['imageUrl'];

    BoxDecoration baseDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 5.0, offset: Offset(0, 5)),
      ],
      color: imageUrl is Color ? imageUrl : null,
    );

    Widget backgroundWidget = Container();

    if (imageUrl is String) {
      backgroundWidget = ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
          errorBuilder: (context, error, stackTrace) {
            // Si la imagen falla en cargar, esto se muestra en su lugar.
            print('ERROR AL CARGAR IMAGEN: $imageUrl');
            return Container(
              color: Colors.red.withOpacity(0.5), // Fondo ROJO si falla
              child: const Center(
                child: Text(
                  "❌ Error de Asset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0), // Espacio entre elementos
      child: InkWell(
        onTap: () {
          // Acción al tocar la tarjeta
          Navigator.push(
            context,
            MaterialPageRoute(
              // Navegamos a TourDetailScreen y le pasamos los datos del día
              builder: (context) => TourDetailScreen(tourDay: tourDay),
            ),
          );
        },
        child: Container(
          height: 150, // Altura fija para la tarjeta
          decoration: baseDecoration,
          child: Stack(
            children: [
              backgroundWidget,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              // El texto del tour
              Center(
                child: Text(
                  tourDay['title'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
