import 'package:flutter/material.dart';

class RoomServiceActions {
  static Future<String?> showRequestDialog(BuildContext context) async {
    TextEditingController requestController = TextEditingController();
    TextEditingController roomNumberController = TextEditingController();
    TextEditingController roomTypeController = TextEditingController();

    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Card(
            elevation: 0, // Set elevation to zero to remove the border
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Request:',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    controller: requestController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Room Number:',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    value: roomNumberController.text.isNotEmpty
                        ? roomNumberController.text
                        : null,
                    items: [
                      'R001',
                      'R002',
                      'R003',
                      'R004',
                      'R005',
                    ]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        roomNumberController.text = newValue;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Room Type:',
                      labelStyle:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    value: roomTypeController.text.isNotEmpty
                        ? roomTypeController.text
                        : null,
                    items: ['Single Room', 'Double Room', 'Twin Room']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        roomTypeController.text = newValue;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String request =
                    'Room Number: ${roomNumberController.text} (${roomTypeController.text})\nRequest: ${requestController.text}';
                Navigator.of(context).pop(request);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
