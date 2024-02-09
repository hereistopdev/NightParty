import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup/sign_up_screen.dart';
import './screens/login_screen.dart';
import './screens/entercode_screen.dart';
import './screens/forget_screen.dart';
import './screens/home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  //async {
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure plugins are initialized
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgetScreen(),
        '/home': (context) => const HomeScreen(),
        '/enter-code': (context) => EnterCodeScreen(),
      },
      // home: const LoginScreen(), // Change to start with the LoginScreen
    );
  }
}
