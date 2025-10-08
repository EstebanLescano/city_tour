import 'package:flutter/material.dart';
import '../widgets/tour_day_text_card.dart';

class TourDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tourDay;

  const TourDetailScreen({super.key, required this.tourDay});

  @override
  Widget build(BuildContext context) {
    // Aquí puedes definir el itinerario específico para cada día
    // Por simplicidad, usaremos un itinerario estático de ejemplo
    final List<Map<String, dynamic>> itinerary = [
      {
        'title': 'Punto de Partida (8:00 AM)',
        'content': 'Reunión en la Plaza Central. Desayuno ligero incluido.',
        'icon': Icons.access_time,
      },
      {
        'title': 'Visita al Templo Antiguo (10:00 AM)',
        'content':
            'Recorrido de 2 horas con guía especializado. ¡No olvides tu cámara!',
        'icon': Icons.church,
      },
      {
        'title': 'Almuerzo y Descanso (1:00 PM)',
        'content': 'Tiempo libre para almorzar en el Mercado de San Telmo.',
        'icon': Icons.restaurant,
      },
      {
        'title': 'Regreso (5:00 PM)',
        'content': 'Retorno al punto de partida o al hotel.',
        'icon': Icons.directions_bus,
      },
    ];

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
                icon: item['icon'] as IconData,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
