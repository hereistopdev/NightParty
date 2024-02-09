import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/forget_screen.dart';
import 'package:flutter_application_1/screens/home/main_screen.dart';
import 'package:flutter_application_1/screens/signup/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Start of the gradient
            end: Alignment.bottomCenter, // End of the gradient
            colors: <Color>[
              Color.fromRGBO(10, 9, 17, 1), // First color
              Color.fromRGBO(41, 9, 47, 1), // Second color
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 176,
                    height: 160,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Please login into your account to continue',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Text(
                    'Sign-in',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email', fillColor: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetScreen()),
                      );
                    },
                    child: const Text('Forget Password?'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
