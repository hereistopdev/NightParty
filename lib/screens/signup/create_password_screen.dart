import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup/create_profile.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  CreatePasswordState createState() => CreatePasswordState();
}

class CreatePasswordState extends State<CreatePassword> {
  bool _isPasswordVisible1 = false; // State variable for password visibility
  bool _isPasswordVisible2 = false; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Password',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
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
                            builder: (context) => const CreateProfileScreen()),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        )
      ),
    );
  }
}
