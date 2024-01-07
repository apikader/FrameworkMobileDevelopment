import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
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
          children: [
            // Insert the Image widget with the appropriate asset path
            Image.asset(
              'assets/image1.png', // Replace with your image file path
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Add some space between the image and button
            Container(
              padding: EdgeInsets.all(16.0), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 133, 59, 185), // Box color
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: Text(
                'Welcome to UMTContact App!\nThis app was developed for\nUMT student save the contact\nfor future used!',
                style: TextStyle(
                  fontSize: 20.0, // Adjust font size as needed
                  fontFamily: 'YourFontFamily', // Replace with your font family
                  fontWeight: FontWeight.bold, // Adjust font weight as needed
                  color: Colors.white, // Text color
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 119, 29, 183),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ), // Add some space between the text box and button

              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }
}
