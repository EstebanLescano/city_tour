import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  /// Verifica si una URL es de red (HTTP o HTTPS)
  static bool isNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'No se pudo lanzar la URL: $url';
    }
  }
}
