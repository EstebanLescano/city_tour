import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// FUNCIONES AUXILIARES
// -----------------------------------------------------------------------------
bool _isNetworkUrl(String url) {
  return url.startsWith('http://') || url.startsWith('https://');
}

// -----------------------------------------------------------------------------
// 3. WIDGET DE IMAGEN (ImageSquare) - Simplificado para solo mostrar imagen
// -----------------------------------------------------------------------------
class ImageSquare extends StatelessWidget {
  const ImageSquare({super.key, required this.imagesquareUrl});

  final String imagesquareUrl;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 80.0;
    final bool isNetwork = _isNetworkUrl(imagesquareUrl);

    if (imagesquareUrl.isEmpty) {
      // Dejamos el contenedor gris simple sin ícono, como pediste
      return Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
      );
    }

    // Widget para mostrar la imagen (red o asset)
    final Widget imageWidget = isNetwork
        ? Image.network(
            imagesquareUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          )
        : Image.asset(
            imagesquareUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          );

    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      clipBehavior: Clip.antiAlias,
      child: imageWidget,
    );
  }
}

// -----------------------------------------------------------------------------
// 2. WIDGET PRINCIPAL DE LA TARJETA (TourDayTextCard)
// -----------------------------------------------------------------------------
class TourDayTextCard extends StatelessWidget {
  final String title;
  final String content;
  final String? imageUrl;
  // Eliminamos el parámetro 'icon' ya que no lo usaremos

  const TourDayTextCard({
    super.key,
    required this.title,
    required this.content,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Siempre usamos ImageSquare para el contenido visual
    final Widget squareWidget = ImageSquare(imagesquareUrl: imageUrl ?? '');

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. EL CUADRADO (Imagen)
            squareWidget,
            const SizedBox(width: 16),
            // 2. Sección del Título y Contenido
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(height: 8, color: Colors.transparent),
                  Text(
                    content,
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PANTALLA DE DETALLE DEL TOUR
// -----------------------------------------------------------------------------
class TourDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tourDay;

  const TourDetailScreen({super.key, required this.tourDay});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itinerary =
        tourDay['itinerary'] as List<Map<String, dynamic>>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(tourDay['title'] as String),
        backgroundColor: const Color.fromARGB(255, 10, 65, 110),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal del día (usa Image.asset directamente)
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

            // LISTA DE ACTIVIDADES
            ...itinerary.map((item) {
              return TourDayTextCard(
                title: item['title'] as String,
                content: item['content'] as String,
                // Pasamos la URL del mapa al widget
                imageUrl: item['imagesquareUrl'] as String?,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
