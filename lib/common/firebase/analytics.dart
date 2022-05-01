import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_roadmap/common/flavors/flavors.dart';

final analytics = FirebaseAnalytics.instance;

void enableFirebaseAnalytics(Flavor flavor) {
  bool enabled = false;
  if (flavor == Flavor.prod) {
    enabled = true;
  }

  analytics.setAnalyticsCollectionEnabled(enabled);
}
