import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/create_event_screen.dart';
import 'package:flutter_application_1/screens/home/main_screen.dart';
import 'package:flutter_application_1/screens/profile/show_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  int _selectedIndex = 0;

  final double _initialScale = 1.5; // Initial scale factor

  final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    CreateEventScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png', // Insert your logo image asset path here
                  fit: BoxFit.contain,
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Night',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         prefixIcon: const Icon(Icons.search),
            //         hintText: 'Search...',
            //         labelText: 'Search...',
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: BorderSide.none,
            //         ),
            //         // filled: true,
            //         // fillColor: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowProfileScreen(),
                  ),
                )
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/avatar.jpg'), // Insert your avatar image URL here
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            boundaryMargin:
                const EdgeInsets.all(0), // Optional: Adds margin around the map
            minScale: 1, // Optional: The minimum scale level for zooming
            maxScale: 10, // Optional: The maximum scale level for zooming
            child: Transform.scale(
              scale: _initialScale,
              child: Image.asset(
                'assets/images/large_map.png', // Replace with your map asset path
                height: 750,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 300, // Position the top from the top of the screen
            right: 200, // Position from the right of the screen
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CreateEventScreen(), // Replace with your next page class
                  ),
                );
              },
              child: const Text('\$200'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(41, 9, 47, 1),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Create Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex, // Indicates the currently selected item
        onTap: _onItemTapped, // Invoked when a bottom item is tapped
      ),
    );
  }
}
