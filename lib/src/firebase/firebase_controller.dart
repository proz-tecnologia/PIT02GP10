import 'package:firebase_core/firebase_core.dart';
import 'package:gastos_app/firebase_options.dart';

class FirebaseController {
  Future<void> setup() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
