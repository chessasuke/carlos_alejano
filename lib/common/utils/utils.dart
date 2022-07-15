import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint('error launch $url: $e');
    }
  }
}
