import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  final String hotelName = 'Oyot Hotel';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 72, 81, 83),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 59, 61),
          title: Text(hotelName),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 55, 59, 61),
                ),
                child: Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  // Navigate to login page
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to $hotelName',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Hotel Management App!',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 40.0),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  shrinkWrap: true,
                  children: [
                    // Check-In & Check-Out
                    buildGridItem(context, 'Book Now', '/firstButton'),
                    // Room Service
                    buildGridItem(context, 'Room Service', '/secondButton'),
                    // Housekeeping
                    buildGridItem(context, 'Housekeeping', '/thirdButton'),
                    // Customer Feedback
                    buildGridItem(
                        context, 'Customer Feedback', '/fourthButton'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(BuildContext context, String title, String route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
