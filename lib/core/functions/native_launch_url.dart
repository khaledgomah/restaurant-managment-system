import 'package:url_launcher/url_launcher.dart';

/// Launch payment URL in external browser (Windows, Android, iOS)
void launchPaymentUrl(String url) async {
  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}