import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'log.dart';
import 'model/user_model.dart';
import 'regis,login/Verify.dart';
import 'package:tangteevs/firebase_options.dart';
import 'package:tangteevs/regis,login/Login.dart';
import 'package:tangteevs/regis,login/Register.dart';
import 'HomePage.dart';
import 'Landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: const Log(),
    routes: {
      '/landing': (context) => const LandingPage(),
      '/Verify': (context) => const Verify(),
      '/login': (context) => Login(),
      '/register': (context) => const RegisterPage(),
      '/HomePage': (context) => MyHomePage(),
    },
  ));
}
