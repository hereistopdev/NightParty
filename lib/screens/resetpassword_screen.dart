import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/successful_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  bool _isPasswordVisible1 = false; // State variable for password visibility
  bool _isPasswordVisible2 = false; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: GradientBackground(
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
                    'Reset new password',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible1 = !_isPasswordVisible1;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible2
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible2 = !_isPasswordVisible2;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SuccessfulScreen()),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
