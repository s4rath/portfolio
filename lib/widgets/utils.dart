import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchURL(String link) async {
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
