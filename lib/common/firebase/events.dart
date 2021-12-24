import 'package:firebase_analytics/firebase_analytics.dart';

final analytics = FirebaseAnalytics.instance;

extension FirebaseAnalyticsExtensions on FirebaseAnalytics {
  static const String customName = 'story_like';

  Future<void> logCustom(String id) => logEvent(
        name: customName,
        parameters: {'custom_id': id},
      );
}
