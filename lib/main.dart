
import 'dart:io';

import 'package:chat_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
  Platform.isAndroid? await Firebase.initializeApp(
    options: const FirebaseOptions( 
          apiKey: "AIzaSyA6pZuWizoRqYTAzo5GQKXpphJd9OOQ9eM", 
          projectId: "chatapp-c49ed", 
          messagingSenderId: "108151476405", 
          appId: "1:108151476405:android:df3fdf0b39a4b9c400aefc",
          storageBucket: 'chatapp-c49ed.appspot.com', 
        ) 
  ):
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
