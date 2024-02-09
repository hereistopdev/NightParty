import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/created_event_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';
import 'package:image_picker/image_picker.dart';

class UpdateEventTabScreen extends StatefulWidget {
  const UpdateEventTabScreen({Key? key}) : super(key: key);

  @override
  UpdateEventTabScreenState createState() => UpdateEventTabScreenState();
}

class UpdateEventTabScreenState extends State<UpdateEventTabScreen> {
  late TextEditingController nameOfPlaceController;
  late TextEditingController purposeController;
  late TextEditingController numberOfPersonsController =
      TextEditingController();
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController priceController;
  late TextEditingController locationController;
  File? _profileImage;

  // Function to handle photo upload
  @override
  void initState() {
    super.initState();
    // Initialize with existing profile data
    nameOfPlaceController = TextEditingController(text: 'Some Place');
    purposeController = TextEditingController(text: 'Seek Friend');
    numberOfPersonsController = TextEditingController(text: '5');
    dateController = TextEditingController(text: '2024-02-04');
    timeController = TextEditingController(text: '90:00 p.m.');
    priceController = TextEditingController(text: '\$5');
    locationController = TextEditingController(text: 'Some Location');
  }

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
          'Create Event',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. 4 small images in a row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: // 2. Input Field for 'Name of Place'
                    TextFormField(
                  controller: nameOfPlaceController,
                  decoration: const InputDecoration(
                    labelText: 'Name of Place',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: purposeController,
                  decoration: const InputDecoration(
                    labelText: 'Purpose',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: numberOfPersonsController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Person allowed',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: timeController,
                  decoration: const InputDecoration(
                    labelText: 'Time',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Set Location',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 240.0, // Set your width to the desired value
                  height:
                      240.0, // Set your height to match the width for a square

                  // Border radius applied to the container for rounded corners
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 235, 225, 225), // Background color
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    image: _profileImage != null
                        ? DecorationImage(
                            image: FileImage(_profileImage!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/images/map_temp.png'),
                            fit: BoxFit.cover,
                          ), // Background image
                  ),

                  // Display the camera icon if there is no profile image
                  child: _profileImage == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 60,
                          color: Color.fromARGB(255, 238, 235, 235),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to handle booking
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreatedEventScreen(), // Replace with your next page class
                    ),
                  );
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
