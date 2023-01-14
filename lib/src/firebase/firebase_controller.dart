import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:gastos_app/firebase_options.dart';

class FirebaseController {
  Future<void> setup() async {
    runZonedGuarded<Future<void>>(
      () async {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );

        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
          true,
        );

        FlutterError.onError = (errorDetails) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        };

        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack);
          return true;
        };

        Isolate.current.addErrorListener(RawReceivePort((pair) async {
          final List<dynamic> errorAndStacktrace = pair;
          await FirebaseCrashlytics.instance.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last,
          );
        }).sendPort);
      },
      (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      },
    );
  }
}
