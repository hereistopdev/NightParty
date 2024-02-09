import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/card_item_screen.dart';
import 'package:flutter_application_1/screens/home/main_screen.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({Key? key}) : super(key: key);

  final TextEditingController nameOfPlaceController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController numberOfPersonsController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

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
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    4,
                    (index) => InkWell(
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CardItemScreen(),
                                ),
                              )
                            },
                        child: Image.asset(
                            'assets/images/image${index + 1}.png',
                            width: 80,
                            height: 80)),
                  ),
                ),
              ),
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
                )
                // 3. Input Field for 'Purpose'
                ,
              ),
              // 8. Text 'Location' in the left with padding as 30
              Padding(
                padding: const EdgeInsets.all(16), // Left padding is 30
                child: Text(
                  'Location',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              // 9. map image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/map_temp.png',
                  width: 250,
                  height: 250,
                ),
              ),
              // 10. Book Button
              ElevatedButton(
                onPressed: () {
                  // Logic to handle booking
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MainScreen(), // Replace with your next page class
                    ),
                  );
                },
                child: const Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
