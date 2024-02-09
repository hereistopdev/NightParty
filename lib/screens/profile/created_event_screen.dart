import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/update_event_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class CreatedEventScreen extends StatefulWidget {
  const CreatedEventScreen({Key? key}) : super(key: key);

  @override
  State<CreatedEventScreen> createState() => _CreatedEventScreenState();
}

class _CreatedEventScreenState extends State<CreatedEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... your AppBar, body, and other widget definitions ...
      appBar: AppBar(
        title: const Text(
          'Created Event',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: const GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MapComponent(), // Custom widget for map component, you need to define this
              MapComponent(), // Custom widget for map component, you need to define this
              MapComponent(), // Custom widget for map component, you need to define this
              MapComponent(), // Custom widget for map component, you need to define this
            ],
          ),
        ),
      ),
    );
  }
}

class MapComponent extends StatelessWidget {
  const MapComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            // Wrap Card with InkWell
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const UpdateEventTabScreen(), // Replace with your next page class
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
                        ),
                        Text(
                          'Date: Dec 31, 2021',
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 15, 90),
                          ),
                        ),
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
