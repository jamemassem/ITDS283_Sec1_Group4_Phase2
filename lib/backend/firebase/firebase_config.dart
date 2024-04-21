import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjTlPW9dyfTVB2SjmI-PZeZ_OvHEYIiK4",
            authDomain: "mu-eng-484mx9.firebaseapp.com",
            projectId: "mu-eng-484mx9",
            storageBucket: "mu-eng-484mx9.appspot.com",
            messagingSenderId: "289689619878",
            appId: "1:289689619878:web:1a688fb0e8f279f0d05367"));
  } else {
    await Firebase.initializeApp();
  }
}
