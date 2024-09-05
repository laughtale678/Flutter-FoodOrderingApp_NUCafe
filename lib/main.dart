import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nu_cafe/services/auth/auth_gate.dart';
import 'package:flutter_nu_cafe/firebase_options.dart';
import 'package:flutter_nu_cafe/models/restaurant.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Restaurant(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nu Cafe',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          background: Color.fromARGB(255, 18, 18, 18),
          primary: Color.fromARGB(255, 122, 122, 122),
          secondary: Color.fromARGB(255, 30, 30, 30),
          tertiary: Color.fromARGB(255, 47, 47, 47),
          inversePrimary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}
