import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Dharmveer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.image_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.credit_card),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true, // Required to fit within SingleChildScrollView
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const EventCard1(
                title: 'Event 1: Title',
                buttonText: 'Register Now',
                  backgroundImage: 'assets/image/ladakh1.jpg'
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Event for You",
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              const EventCard2(
                title: 'Events: Title',
                buttonText1: 'Invite',
                priceText: '..... - .....INR',
                  backgroundImage: 'assets/image/OIP (1).jpg'
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [ Tab(text: 'RIDES'),
                  Tab(text: 'STORIES'),
                  Tab(text: 'MARKET'),
                  Tab(text: 'GARAGE'),
                ],
              ),
              SizedBox(
                height: 700, // Adjust height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
        
                    const Center( child: ListView(
                      padding: EdgeInsets.all(8.0),
                      children: [
                        buildSection('Event 1'),
                        buildSection('Event 2'),
                        buildSection('Event 3'),
                        buildSection('Event 4'),
                        buildSection('Event 5'),
                        buildSection('Event 6'),
                        buildSection('Event 7'),
                        buildSection('Event 8'),
                        buildSection('Event 7')], )),
                    Center(child: ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        buildSection('Title 1'),
                        buildSection('Title 2'),
                        buildSection('Title 3'),
                        buildSection('Title 4'),
                        buildSection('Title 5'),
                        buildSection('Title 6'),
                        buildSection('Title 7')], )),
                      Container(width: double.infinity,
                    color: Colors.lightGreen,
                    child: const Center(child: Text("Market Details Here")),),
                    Container(width: double.infinity,
                    color: Colors.pinkAccent,
                    child: const Center(child: Text("Garage Details Here")),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class EventCard1 extends StatelessWidget {
  final String title;
  final String buttonText;
  final String backgroundImage;

  const EventCard1({super.key,
    required this.title,
    required this.buttonText,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.yellow.shade700, // Text color
              ),
              child: Text(buttonText,style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard2 extends StatelessWidget {
  final String title;
  final String buttonText1;
  final String priceText;
  final String backgroundImage;

  const EventCard2({super.key,
    required this.title,
    required this.buttonText1,
    required this.priceText,
    required  this.backgroundImage

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(title,
                  style: const TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.yellow.shade700, // Text color
                ),
                child: Text(buttonText1,style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.yellow.shade700, // Text color
              ),
              child: Text(priceText,style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildSection(String title) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Padding( padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( title,
            style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, ),
          ),
          const SizedBox(height: 8.0),
          const Text( 'Lorem i ',
            style: TextStyle(fontSize: 16.0), ),
        ], ), ), ); }
