import 'package:carlos_alejano_v2/services/analytics/base/analytics_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsProvider = Provider((ref) {
  return AnalyticsManager();
});
