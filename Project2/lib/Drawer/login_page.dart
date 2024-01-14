import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Login',
      home: AdminLoginPage(),
    );
  }
}

class AdminLoginPage extends StatelessWidget {
  final TextEditingController adminController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    // Your Firebase Realtime Database URL
    final String firebaseUrl =
        'https://hotel-management-46f8f-default-rtdb.asia-southeast1.firebasedatabase.app/users/-Nny59BYyoQrliz0Qjzu.json';

    try {
      // Make HTTP request to update data in Firebase
      final response = await http.patch(
        Uri.parse(firebaseUrl),
        body: jsonEncode({
          'adminUsername': adminController.text.trim(),
          'lastLogin': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        // Data successfully updated
        print('Data updated successfully');
        // Show a Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Handle error
        print('Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error during HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 59, 61),
        title: Text('Admin Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: adminController,
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                labelText: 'Admin Username',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.yellow),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call loginUser when the login button is pressed
                loginUser(context);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
