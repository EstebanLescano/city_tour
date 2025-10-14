import 'package:city_tour/utils/utils_functions.dart';
import 'package:flutter/material.dart';

class ImageSquare extends StatelessWidget {
  const ImageSquare({super.key, required this.imagesquareUrl});

  final String imagesquareUrl;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 80.0;
    final bool isNetwork = UrlUtils.isNetworkUrl(imagesquareUrl);

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
