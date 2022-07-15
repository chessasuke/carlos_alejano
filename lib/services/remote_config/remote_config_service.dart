// import 'package:carlos_alejano_v2/services/remote_config/remote_config_keys.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';

// class RemoteConfigService {
//   RemoteConfigService() {
//     _init();
//   }

//   late FirebaseRemoteConfig _remoteConfig;
  
//   static const Duration EXPIRATION_TIME = Duration(minutes: 30);
//   static const Duration FETCH_TIMEOUT_TIME = Duration(minutes: 1);

//   bool _wasLastFetchSuccessful = false;

//   Future<RemoteConfigService> _init() async {
//     return initWithConfig(remoteConfig: FirebaseRemoteConfig.instance);
//   }

//   @visibleForTesting
//   Future<RemoteConfigService> initWithConfig(
//       {required FirebaseRemoteConfig remoteConfig}) async {
//     _remoteConfig = remoteConfig;
//     await _remoteConfig.setConfigSettings(
//       RemoteConfigSettings(
//         fetchTimeout: FETCH_TIMEOUT_TIME,
//         minimumFetchInterval: EXPIRATION_TIME,
//       ),
//     );
//     await _initialFetchAndActivate();
//     return this;
//   }

//   Future<void> _initialFetchAndActivate() async {
//     try {
//       await _remoteConfig.fetchAndActivate();
//       _wasLastFetchSuccessful = true;
//     } catch (exception, stackTrace) {
//       _wasLastFetchSuccessful = false;
//       // await locator<FirebaseCrashlyticsManager>()
//       //     .recordError(exception, stackTrace);
//     }
//   }

//   Future<void> fetchAndActivate({
//     required BuildContext context,
//     bool shouldSchedule = true,
//     bool shouldPop = true,
//   }) async {
//     try {
//       await _remoteConfig.fetchAndActivate();
//       _wasLastFetchSuccessful = true;
//     } on FirebaseException catch (exception) {
//       _onFetchFailByFirebaseException(context, shouldSchedule, exception);
//     } catch (exception) {
//       _onFetchFailByGenericException(context, shouldSchedule);
//     }
//   }

//   void _onFetchFailByFirebaseException(
//       BuildContext context, bool shouldSchedule, FirebaseException exception) {
//     if (_wasLastFetchSuccessful) {
//       _wasLastFetchSuccessful = false;
//       debugPrint(exception.message);
//     }
//   }

//   void _onFetchFailByGenericException(
//       BuildContext context, bool shouldSchedule) {
//     if (_wasLastFetchSuccessful) {
//       _wasLastFetchSuccessful = false;
//       debugPrint('Unable to fetch remote config.');
//     }
//   }

//   // void handleConfigRefreshOnAppResume(BuildContext context) async {
//   //   SystemChannels.lifecycle.setMessageHandler((lifecycleString) async {
//   //     if (lifecycleString == AppLifecycleState.resumed.toString()) {
//   //       await fetchAndActivate(
//   //         context: context,
//   //         shouldSchedule: false,
//   //       );
//   //     }
//   //     return lifecycleString;
//   //   });
//   // }

//   String getStringFromKey(String key) => _remoteConfig.getString(key);

//   Map<String, dynamic> get values => _remoteConfig.getAll();

//   String get profileCardName =>
//       _remoteConfig.getString(RemoteConfigKeys.profileCardName);

//   String get profileCardPosition =>
//       _remoteConfig.getString(RemoteConfigKeys.profileCardPosition);

//   String get profileCardLocation =>
//       _remoteConfig.getString(RemoteConfigKeys.profileCardLocation);

//   String get aboutContent =>
//       _remoteConfig.getString(RemoteConfigKeys.aboutContent);
// }
