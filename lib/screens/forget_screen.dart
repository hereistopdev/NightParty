import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/entercode_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GradientBackground(
            child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      'Night Party',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Text(
                      'Enter your email that you used to register your account, so we can send you a security code to reset your password.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterCodeScreen()),
                      );
                    },
                    child: const Text('Send Code'),
                  ),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
