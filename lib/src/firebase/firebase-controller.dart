import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';

class FirebaseController {
  FirebaseController() {
    init();
  }

  Future<void> init() async {
    final instance = await Firebase.initializeApp(
      name: 'Gastos-APP',
      options: const FirebaseOptions(
        apiKey: "AIzaSyDwBadOMmrz38v9hAEfSnEE3Us7U2L8DBg",
        appId: "1:1042540631912:android:c215afe6aa51a104e928dd",
        messagingSenderId: "1042540631912",
        projectId: "gastos-app-33002",
      ),
    );
    log('Firebase was configured');
  }
}
