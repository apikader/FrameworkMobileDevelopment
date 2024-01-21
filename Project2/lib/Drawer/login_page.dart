import 'dart:convert';
import 'package:app4/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: AdminLoginPage(),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController adminController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Variable to store the selected role
  String selectedRole = 'admin';

  Future<void> loginUser(BuildContext context) async {
    // Your Firebase Realtime Database URL
    final String firebaseUrl =
        'https://hotel-management-46f8f-default-rtdb.asia-southeast1.firebasedatabase.app/users.json';

    try {
      // Make HTTP request to create new data in Firebase
      final response = await http.post(
        Uri.parse(firebaseUrl),
        body: jsonEncode({
          'adminUsername': adminController.text.trim(),
          'lastLogin': DateTime.now().toIso8601String(),
          'role': selectedRole,
        }),
      );

      if (response.statusCode == 200) {
        // Data successfully created
        print('Data created successfully');
        // Show a Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Handle error
        print('Failed to create data. Status code: ${response.statusCode}');
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
        title: Text('Login'),
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
                labelText: 'Username',
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
            // Radio buttons for Admin and Customer roles
            Row(
              children: [
                Radio(
                  value: 'admin',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value as String;
                    });
                  },
                ),
                Text(
                  'Admin',
                  style: TextStyle(color: Colors.yellow),
                ),
                Radio(
                  value: 'customer',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value as String;
                    });
                  },
                ),
                Text(
                  'Customer',
                  style: TextStyle(color: Colors.yellow),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                // Call the loginUser method to create new data
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
