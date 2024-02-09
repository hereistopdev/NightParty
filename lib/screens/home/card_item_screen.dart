import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/gradient_background.dart';

class CardItemScreen extends StatefulWidget {
  const CardItemScreen({Key? key}) : super(key: key);

  @override
  CardItemScreenState createState() => CardItemScreenState();
}

class CardItemScreenState extends State<CardItemScreen> {
  int _counter = 0;
  double _totalPrice =
      0.0; // Assuming price per item is constant, for example, $10
  final _pricePerItem = 10.0; // Price for each counted item.

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateTotalPrice();
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    _totalPrice = _pricePerItem * _counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Night',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 17, 1),
      ),
      body: GradientBackground(
        child: Column(
          children: [
            // The card component
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: const Color.fromRGBO(41, 9, 47, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/image1.png',
                        width: 100,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name of Place',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('Purpose'),
                            const Text('Date and Time'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width:
                                        36.0, // Set a specific width for the container
                                    height:
                                        36.0, // Set a specific height for the container
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      onPressed: _decrementCounter,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      '$_counter',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium, // Use a valid text theme
                                    ),
                                  ),
                                  Container(
                                    width:
                                        36.0, // Set a specific width for the container
                                    height:
                                        36.0, // Set a specific height for the container
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.add,
                                          color: Colors.black),
                                      onPressed: _incrementCounter,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Total Price: \$$_totalPrice',
                  style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
