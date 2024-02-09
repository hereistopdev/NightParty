import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup/verification.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  // Future<void> signUpWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // Sign up successful, navigate to the dashboard or verify the email
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               VerificationScreen()), // Replace with your dashboard screen
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     // Sign up failed, show an error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Failed to sign up: ${e.message}")),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child:  GradientBackground(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
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
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Please login into your account to continue',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                          child: Text(
                            'Sign-up',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            decoration: const InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 150, bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen()),
                              );
                            },
                            child: const Text('Next'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text('Already have an account? Sign-in'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ),
        ),
      )
    );
  }
}
