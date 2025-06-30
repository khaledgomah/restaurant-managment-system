// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

/// Launch payment URL in a new browser tab (Web only)
void launchPaymentUrl(String url) {
  html.window.open(url, '_blank');
}
