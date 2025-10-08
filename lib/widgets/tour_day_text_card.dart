import 'package:flutter/material.dart';

// Widget para mostrar información detallada del itinerario sin una imagen de fondo.
class TourDayTextCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const TourDayTextCard({
    super.key,
    required this.title,
    required this.content,
    this.icon =
        Icons.info_outline, // Icono por defecto si no se proporciona uno
  });

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icono
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                // Título
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            // Contenido/Descripción
            Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
