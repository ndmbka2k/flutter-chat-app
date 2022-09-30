import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_app/ui/chat_page/chat_page.dart';
import 'package:flutter_login_app/ui/home_page/home_page.dart';
import 'package:flutter_login_app/ui/sign_in_page/sign_in_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        'home' : (context) => const HomePage(),
        'sign_in' : (context) => const LoginPage(),
        'chat' : (context) => const ChatPage(),
      },
    );
  }
}

