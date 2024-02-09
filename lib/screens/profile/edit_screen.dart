import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/main_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _bioController;
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    // Initialize with existing profile data
    _firstNameController = TextEditingController(text: 'Bryan');
    _lastNameController = TextEditingController(text: 'Jin');
    _bioController = TextEditingController(text: 'hereis.topdev@gmail.com');
  }

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
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile photo selection
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 208, 186, 186),
                  backgroundImage: const AssetImage('assets/images/avatar.jpg'),
                  // backgroundImage:
                  //     _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage != null
                      ? Icon(
                          Icons.camera_alt,
                          size: 60,
                          color: Colors.grey[600],
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),

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
                maxLines: 5, // Allow multiline text input for Bio
                controller: _bioController,
              ),
              const SizedBox(height: 20),

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
        ),
      ),
    );
  }
}
