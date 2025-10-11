import 'package:city_tour/widgets/tour_day_text_card.dart';
import 'package:flutter/material.dart';

class TourDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tourDay;

  const TourDetailScreen({super.key, required this.tourDay});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itinerary =
        tourDay['itinerary'] as List<Map<String, dynamic>>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(tourDay['title'] as String), // Muestra el título del día
        backgroundColor: const Color.fromARGB(255, 10, 65, 110),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Muestra una imagen grande del día (opcional, si hay una URL)
            if (tourDay['imageUrl'] is String)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    tourDay['imageUrl'] as String,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),

            // TITULO DEL ITINERARIO
            const Text(
              'Itinerario del Día:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // LISTA DE ACTIVIDADES (Usando el nuevo widget de tarjeta de texto)
            ...itinerary.map((item) {
              return TourDayTextCard(
                title: item['title'] as String,
                content: item['content'] as String,
                imageUrl: item['imagesquareUrl'] as String?,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
