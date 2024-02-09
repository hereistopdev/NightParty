import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/main_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  CreateProfileScreenState createState() => CreateProfileScreenState();
}

class CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  File? _profileImage;

  // Function to handle photo upload
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

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
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile photo selection
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          backgroundImage:
                          _profileImage != null ? FileImage(_profileImage!) : null,
                          child: _profileImage == null
                              ? const Icon(
                            Icons.image_outlined,
                            size: 80,
                            color: Color.fromRGBO(25, 9, 31, 1),
                          )
                              : null,
                        ),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 5,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 25,
                          color: Color.fromRGBO(41, 9, 47, 1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  // First name input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: _firstNameController,
                  ),
                  const SizedBox(height: 10),
                  // Last name input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 10),
                  // Bio input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 1, // Allow multiline text input for Bio
                    controller: _bioController,
                  ),
                  const SizedBox(height: 20),
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  // Save profile button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    child: const Text('Save Profile'),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
