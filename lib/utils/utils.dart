import 'package:carlos_alejano_v2/services/analytics/models/event.dart';
import 'package:carlos_alejano_v2/services/analytics/providers/analytics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint('error launch $url: $e');
    }
  }

  static trackEvent({
    required Event event,
    required WidgetRef ref,
  }) {
    ref.read(analyticsProvider).trackEvent(event);
  }
}
