import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup/create_password_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  final TextEditingController _pinController =
      TextEditingController(); // Create a controller for the pin code

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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GradientBackground(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
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
                        'Verification',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      child: Text(
                        'Code has sent to abc@gmail.com',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 50),
                        child: Column(
                          children: [
                            const Text(
                              'OTP',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            PinCodeTextField(
                              appContext: context,
                              length: 5, // Adjust length for a four-digit code
                              controller:
                              _pinController, // Assign the controller to the PinCodeTextField
                              onChanged: (value) {
                                // Currently, we don't do anything when the value changes
                              },
                              pinTheme: const PinTheme.defaults(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align children to the start of the row
                              children: [
                                const Text(
                                  'Haven’t recevied the verification code',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  // Add padding around the button
                                  padding: const EdgeInsets.only(left: 20), // Only apply padding to the left side of the button
                                  child: TextButton(
                                    onPressed: () {
                                      // Your button tap logic here
                                    },
                                    child: const Text('Resend'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    ElevatedButton(
                      onPressed: () {
                        // Use _pinController.text to get the entered code.
                        String enteredCode = _pinController.text;

                        // Check if the code is correct. This is just an example, in actuality,
                        // you would likely send this code to a backend service for verification.
                        if (enteredCode == "12345") {
                          // Example check for a predetermined code
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreatePassword()),
                          );
                        } else {
                          // If code is incorrect, you can show an error message.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Invalid code entered. Please try again.')),
                          );
                        }
                      },
                      child: const Text('Verify'),
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
