import 'package:carlos_alejano_v2/firebase_options.dart';
import 'package:carlos_alejano_v2/generated/i18n.dart';
import 'package:carlos_alejano_v2/services/analytics/providers/analytics_provider.dart';
import 'package:carlos_alejano_v2/services/analytics/trackers/firebase_analytics_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigator/route_parser.dart';
import 'navigator/router_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  late final FirebaseAnalyticsTracker firebaseAnalyticsTracker;
  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  void initState() {
    super.initState();
    firebaseAnalyticsTracker = FirebaseAnalyticsTracker(ref.read(analyticsProvider));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Carlos Alejano",
      color: Colors.grey,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
