import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/Edit_screen.dart';
import 'package:flutter_application_1/screens/profile/activities_screen.dart';
import 'package:flutter_application_1/screens/profile/created_event_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class ShowProfileScreen extends StatefulWidget {
  const ShowProfileScreen({Key? key}) : super(key: key);

  @override
  ShowProfileScreenState createState() => ShowProfileScreenState();
}

class ShowProfileScreenState extends State<ShowProfileScreen> {
  // Assume these variables are populated from a user profile data source
  final String _fullName = "Bryan Jin";
  final String _bio =
      "When the party is lit, and the vibes are right, you can't help but have the time of your life!";
  final String _profileImageUrl = "assets/images/avatar.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color.fromRGBO(255, 229, 229, 1),
        actions: [
          PopupMenuButton<String>(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.more_vert), // Three-dot more icon
            offset: const Offset(10, 45), // Move down the menu by 50 units
            onSelected: (value) {
              switch (value) {
                // Add a switch case for handling selections
                case 'option1':
                  // Navigate to Option1Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatedEventScreen()),
                  );
                  break;
                case 'option2':
                  // Navigate to Option1Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivitiesScreen()),
                  );
                  break;
                // Add more cases for other menu options if needed
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'option1',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.calendar_month, size: 20.0),
                    ), // Plus calendar icon at the end of the menu item
                    Text('Created Events'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'option2',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.history_toggle_off, size: 20.0),
                    ), // History clock icon at the end of the menu item
                    Text('Activities'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: GradientBackground(
        child: Stack(
          children: [
            Container(
              width: double.infinity, // Full width of the screen
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 229, 229, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(60), // 60 radius for bottom left corner
                  bottomRight:
                      Radius.circular(60), // 60 radius for bottom right corner
                ),
              ),
              child: const SizedBox(
                height: 230,
              ) /* Add your child widgets here */,
            ),
            ListView(
              children: [
                const SizedBox(height: 150),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: AssetImage(_profileImageUrl),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  _fullName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    _bio,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()),
                      );
                    },
                    icon: const Icon(Icons.edit), // Pencil icon (edit)
                    label: const Text(
                        'Edit Profile'), // The text that will appear beside the icon
                  ),
                ),
                // Add other profile details or settings here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
