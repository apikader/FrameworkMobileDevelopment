import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReceiptPage extends StatelessWidget {
  final contact;

  ReceiptPage({required this.contact});

  Future<void> submitToFirebase() async {
    // Updated Firebase Realtime Database URL
    const firebaseUrl =
        'https://hotel-management-46f8f-default-rtdb.asia-southeast1.firebasedatabase.app/users/-Nny59BYyoQrliz0Qjzu.json';

    try {
      final response = await http.patch(
        Uri.parse(firebaseUrl),
        body: json.encode({
          'name': contact.name,
          'ICNumber': contact.ICNumber,
          'phoneNumber': contact.phoneNumber,
          'roomNumber': contact.roomNumber,
          'roomType': contact.roomType,
          'checkInDate': contact.checkInDate,
          'checkOutDate': contact.checkOutDate,
        }),
      );

      if (response.statusCode == 200) {
        print('Data submitted to Firebase successfully!');
      } else {
        print(
            'Failed to submit data to Firebase. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error submitting data to Firebase: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Receipt'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Receipt Details',
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Name: ${contact.name}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('IC Number: ${contact.ICNumber}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Phone Number: ${contact.phoneNumber}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Room Number: ${contact.roomNumber}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Room Type: ${contact.roomType}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Check-In Date: ${contact.checkInDate}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Check-Out Date: ${contact.checkOutDate}',
                    style: TextStyle(color: Colors.yellow)),
              ),
              SizedBox(height: 20),
              Image.asset(
                'images/image4.png',
                height: 300,
                width: 300,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/firstButton');
                    submitToFirebase();
                  },
                  child: Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
