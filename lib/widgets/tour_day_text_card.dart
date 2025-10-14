import 'package:flutter/material.dart';
import '../utils/utils_functions.dart';
import 'image_square.dart';

class TourDayTextCard extends StatelessWidget {
  final String title;
  final String content;
  final String? imageUrl;
  final String? targetUrl;
  // Eliminamos el parámetro 'icon' ya que no lo usaremos

  const TourDayTextCard({
    super.key,
    required this.title,
    required this.content,
    this.imageUrl,
    this.targetUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Siempre usamos ImageSquare para el contenido visual
    final bool isClickable = targetUrl != null && targetUrl!.isNotEmpty;

    // Usamos InkWell para el efecto de "ripple" si es clicable
    return InkWell(
      onTap: isClickable
          ? () {
              // Si es clicable, lanzamos la URL
              UrlUtils.openUrl(targetUrl!);
            }
          : null, // Si no hay URL, el onTap es null (no clicable)
      // Agregamos un indicador visual de que es clicable si hay un link
      customBorder: isClickable
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          : null,

      child: Padding(
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
            // Opcional: Color de borde para destacar si es un link
            border: isClickable
                ? Border.all(color: Colors.blueAccent, width: 1)
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. EL CUADRADO (Imagen)
              ImageSquare(imagesquareUrl: imageUrl ?? ''),
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
                    // Indicador visual si es clicable
                    if (isClickable) ...[
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.link, color: Colors.blueAccent, size: 16),
                          SizedBox(width: 4),
                          Text('Ver en el mapa',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
