import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';
import './login_screen.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Then navigate to the LoginScreen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) =>
                    false, // Remove all routes below the pushed route
              );
            },
          ),
        ],
      ),
      body: const GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Password reset successfully',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.check_circle_sharp,
                size: 88,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
