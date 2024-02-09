import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/home/create_event_screen.dart';
import 'package:flutter_application_1/screens/home/create_event_tab_screen.dart';
import 'package:flutter_application_1/screens/home/map_screen.dart';
import 'package:flutter_application_1/screens/profile/show_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    const CreateEventTabScreen(),
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
      // ... your AppBar, body, and other widget definitions ...
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    labelText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    // filled: true,
                    // fillColor: Colors.white,
                  ),
                ),
              ),
            ),
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
      body: const GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MapComponent(
                title: "Today's event",
              ), // Custom widget for map component, you need to define this
              MapComponent(
                title: "Upcoming event",
              ), // The second map component
            ],
          ),
        ),
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

// Implement MapComponent and ChatScreen here or in separate files
class MapComponent extends StatelessWidget {
  final String title;

  const MapComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // Wrap Card with InkWell
            onTap: () {
              // Handle the tap event and navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MapScreen(), // Replace with your next page class
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    child: Image.asset('assets/images/map_temp.png'),
                  ), // Replace with your map imagery or widget
                  const ListTile(
                    title: Text('Place Name'),
                    subtitle: Text('Party Purpose'),
                    trailing: Text('\$Price'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time: 9PM',
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 15, 90),
                          ),
                        ), // Example time
                        Text(
                          'Date: Dec 31, 2021',
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 15, 90),
                          ),
                        ), // Example date
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: const GradientBackground(
          child: Center(
        child: Text('Chat screen content goes here'),
      )),
    );
  }
}
