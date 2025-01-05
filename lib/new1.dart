import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rides'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                EventCard(
                  title: 'ride to nandi hills',
                  imageUrl: '',
                  riderName: 'manish surapaneni',
                  bike: 'Ducati',
                  distance: '900 km',
                  date: 'July 20 2024',
                  coRiders: '12',
                  location: 'hyderabad',
                ),
                EventCard(
                  title: 'ride to cochi hills',
                  imageUrl: '',
                  riderName: 'manish surapaneni',
                  bike: 'Ducati',
                  distance: '900 km',
                  date: 'July 20 2024',
                  coRiders: '12',
                  location: 'hyderabad',
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: [ Tab(text: 'RIDES'),
              Tab(text: 'STORIES'),
              Tab(text: 'MARKET'),
              Tab(text: 'GARAGE'),
            ],
          ),
          Container(
            height: 200, // Adjust height as needed
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Content for RIDES')),
                Center(child: Text('Content for STORIES')),
                Center(child: Text('Content for MARKET')),
                Center(child: Text('Content for GARAGE')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String riderName;
  final String bike;
  final String distance;
  final String date;
  final String coRiders;
  final String location;

  EventCard({
    required this.title,
    required this.imageUrl,
    required this.riderName,
    required this.bike,
    required this.distance,
    required this.date,
    required this.coRiders,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imageUrl),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Rider: $riderName'),
          Text('Bike: $bike'),
          Text('Distance: $distance'),
          Text('Date: $date'),
          Text('Co-Riders: $coRiders'),
          Text('Location: $location'),
        ],
      ),
    );
  }
}