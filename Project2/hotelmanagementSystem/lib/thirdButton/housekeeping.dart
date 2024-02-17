import 'package:flutter/material.dart';
import 'package:app4/thirdButton/floatingActionButton.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<String> requests = [];
  String actionResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('House Keeping'),
      ),
      body: Column(
        children: [
          Image.asset(
            'images/housekeeping.png', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200, // Adjust the height as needed
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: requests.length,
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.grey),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            requests[index],
                            style: TextStyle(color: Colors.yellow),
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
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
