import 'package:flutter/material.dart';
import 'contact_list.dart';
import 'add_contact.dart';

class Home extends StatelessWidget {
  final List<Contact> contacts;

  Home({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 212, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 29, 183),
        title: Text('UMTContact'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0), // Adjust padding as needed
                  backgroundColor: Color.fromARGB(255, 119, 29, 183),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
                child: Text('CREATE CONTACT'),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0), // Adjust padding as needed
                  backgroundColor: Color.fromARGB(255, 119, 29, 183),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('VIEW CONTACTS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
