import 'package:flutter/material.dart';
// import 'package:app2/firstButton/checkincheckout.dart';
// import 'package:app2/firstButton/add_contact.dart';
// import 'package:app2/firstButton/contact_list.dart';
// import 'package:app2/firstButton/typeOfRoom.dart';

class FirstButton extends StatelessWidget {
  // final List<Contact> contacts;

  // FirstButton({required this.contacts});

  @override
  Widget build(BuildContext context) {
    const buttonPadding = EdgeInsets.all(20.0);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Book Now'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
// Already Book Button
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('ALREADY BOOK'),
              ),
            ),
// Start Booking Button
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: Text('START BOOKING'),
              ),
            ),
// view list of room
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/forth');
                },
                child: Text('TYPE OF ROOM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
