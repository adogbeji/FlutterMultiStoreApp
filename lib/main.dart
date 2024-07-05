import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:multi_store/secrets/secret_keys.dart';

import 'package:multi_store/views/buyers/main_screen.dart';
import 'package:multi_store/views/buyers/auth/register_screen.dart';

// SECRET KEYS
final secrets = SecretKeys();

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all Flutter widgets have been successfully initialised

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: secrets.akiKey,
              appId: secrets.appId,
              messagingSenderId: secrets.messagingSenderId,
              projectId: secrets.projectId,
              storageBucket: secrets.storageBucket),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Brand-Bold',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainScreen(),
      home: const RegisterScreen(),
    );
  }
}
