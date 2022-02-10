import 'package:firebase_analytics/firebase_analytics.dart';

//统计
FirebaseAnalytics analytics = FirebaseAnalytics.instance;
FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);
