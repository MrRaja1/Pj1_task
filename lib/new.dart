import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Cards Example'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            EventCard1(
              title: 'Event 1: Title',
              buttonText: 'Register Now',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Event for You"),
            ),
            EventCard2(
              title: 'Event 2: Title',
              buttonText1: 'Invite',
              priceText: 'Price',
            ),

        ],
        ),
      ),
    );
  }
}

class EventCard1 extends StatelessWidget {
  final String title;
  final String buttonText;

  EventCard1({
    required this.title,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard2 extends StatelessWidget {
  final String title;
  final String buttonText1;
  final String priceText;

  EventCard2({
    required this.title,
    required this.buttonText1,
    required this.priceText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(buttonText1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(priceText),
            )
          ],
        ),
      ),
    );
  }
}

