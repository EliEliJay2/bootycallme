import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuyG0ylmrwzGeT_Yz92PhDN74zqp9j2S8",
            authDomain: "bootycallme55.firebaseapp.com",
            projectId: "bootycallme55",
            storageBucket: "bootycallme55.appspot.com",
            messagingSenderId: "483674293958",
            appId: "1:483674293958:web:e531f89cd8cf6c508b39c7",
            measurementId: "G-Q2M14H0TKY"));
  } else {
    await Firebase.initializeApp();
  }
}
