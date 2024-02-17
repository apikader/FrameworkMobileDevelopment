import 'package:flutter/material.dart';

class RoomServiceActions {
  static Future<String?> showRequestDialog(BuildContext context) async {
    TextEditingController roomNumberController = TextEditingController();
    TextEditingController typeCleaningController = TextEditingController();
    TextEditingController roomTypeController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('House Keeping'),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Type Cleaning:',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  value: typeCleaningController.text.isNotEmpty
                      ? typeCleaningController.text
                      : null,
                  items: [
                    'clean the room',
                    'clean the bathroom',
                    'air conditioner maintenance',
                    'change the bed sheets',
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      typeCleaningController.text = newValue;
                    }
                  },
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
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, ''); // Return an empty string
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String request =
                    'Room Number: ${roomNumberController.text} (${roomTypeController.text})\nRequest: ${typeCleaningController.text}';
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
