import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:login_template_firebase/common/flavors/flavors.dart';

final analytics = FirebaseAnalytics.instance;

void enableFirebaseAnalytics(Flavor flavor) {
  bool enabled = false;
  if (flavor == Flavor.PROD) {
    enabled = true;
  }

  analytics.setAnalyticsCollectionEnabled(enabled);
}
