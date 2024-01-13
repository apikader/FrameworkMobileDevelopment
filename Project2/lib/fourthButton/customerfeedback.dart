import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _feedbackTextController = TextEditingController();
  int _selectedRating = 0;

  void _submitFeedback() {
    // You can implement logic to handle the submitted feedback here
    String customerName = _customerNameController.text;
    String feedbackText = _feedbackTextController.text;

    // Save or process the feedback as needed
    // For example, you can use the FeedbackManager class mentioned earlier

    // After processing, you can clear the text fields and selected rating
    _customerNameController.clear();
    _feedbackTextController.clear();
    _selectedRating = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text(
          'Customer Feedback',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Do you satisfy with this app?',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedRating = index + 1;
                    });
                  },
                  icon: Icon(
                    index < _selectedRating ? Icons.star : Icons.star_border,
                    size: 30.0,
                    color: Colors.yellow,
                  ),
                );
              }),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _customerNameController,
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: TextStyle(color: Colors.yellow)),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackTextController,
              style: TextStyle(color: Colors.yellow),
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'Feedback',
                  labelStyle: TextStyle(color: Colors.yellow)),
            ),
            SizedBox(height: 400.0),
            ElevatedButton(
              onPressed: _submitFeedback,
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text('Submit Feedback',
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
