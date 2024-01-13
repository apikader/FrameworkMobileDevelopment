import 'package:flutter/material.dart';
import 'package:app4/secondButton/floatingButton.dart';

class RoomServiceScreen extends StatefulWidget {
  @override
  _RoomServiceScreenState createState() => _RoomServiceScreenState();
}

class _RoomServiceScreenState extends State<RoomServiceScreen> {
  List<String> requests = [];
  String actionResult = 'No action performed yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Room Service'),
        elevation:
            0, // Set elevation to 0 to eliminate space between AppBar and content
      ),
      body: Column(
        children: [
          Image.asset(
            'images/roomservice.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300, // Adjust the height as needed
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: requests.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            requests[index],
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              String? result =
                  await RoomServiceActions.showRequestDialog(context);

              if (result != null && result.isNotEmpty) {
                setState(() {
                  actionResult = result;
                  requests.add(result);
                });
              }
            },
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16), // Adjust the spacing as needed
        ],
      ),
    );
  }
}
