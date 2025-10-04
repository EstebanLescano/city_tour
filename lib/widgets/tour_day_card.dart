import 'package:flutter/material.dart';

// El widget debe ser StatelessWidget porque solo muestra datos que recibe.
class TourDayCard extends StatelessWidget {
  // 1. Definimos las propiedades que necesita el widget.
  final Map<String, dynamic> tourDay;
  // 2. El constructor para recibir los datos.
  const TourDayCard({super.key, required this.tourDay});

  @override
  Widget build(BuildContext context) {
    // 3. Extraemos el widget complejo (el InkWell envuelto en Padding)
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0), // Espacio entre elementos
      child: InkWell(
        onTap: () {
          // TODO: Implementar la navegación a la pantalla de detalles del tour
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clic en: ${tourDay['title']}')),
          );
        },
        child: Container(
          height: 200, // Altura fija para la tarjeta
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
            ],
            // Simulación de la imagen de fondo (reemplaza 'imageUrl' por AssetImage)
            color: tourDay['imageUrl'] as Color,
          ),

          // Usamos Stack para superponer el texto sobre la imagen
          child: Stack(
            children: [
              // Capa oscura semi-transparente para mejorar la legibilidad
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
