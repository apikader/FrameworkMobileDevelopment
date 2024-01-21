import 'package:flutter/material.dart';

class TypeOfRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Room Types'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoomImage(
              imagePath: 'images/image1.png',
              title: 'Single Room',
              info:
                  'INFORMATION\n• Size of room: 15m²\nSize of bed: 120cm×203cm\n• Wi-Fi: all guest rooms have individual connection\n• BRAVIA smart TVs are installed in all guest rooms\n• All guest rooms are equipped with an air purifier / humidifier, a trouser press, and a safety deposit box\n• All Non-smoking rooms (Smoking corner on 2nd floor)\n\nRM90/day',
            ),
            RoomImage(
              imagePath: 'images/image2.png',
              title: 'Double Room',
              info:
                  'INFORMATION\n• Size of room: 17m²\n• Size of bed: 160cm×203cm\n• Wi-Fi: all guest rooms have individual connection\n• BRAVIA smart TVs are installed in all guest rooms\n• All guest rooms are equipped with an air purifier / humidifier, a trouser press, and a safety deposit box\n• All Non-smoking rooms (Smoking corner on 2nd floor)\n\nRM150/day',
            ),
            RoomImage(
              imagePath: 'images/image3.png',
              title: 'Twin Room',
              info:
                  'INFORMATION\n• Size of room: 17m²\nSize of bed: 105cm×195cm\n• Wi-Fi: all guest rooms have individual connection\n• BRAVIA smart TVs are installed in all guest rooms\n• All guest rooms are equipped with an air purifier / humidifier, a trouser press, and a safety deposit box\n• All Non-smoking rooms (Smoking corner on 2nd floor)\n\nRM180/day',
            ),
          ],
        ),
      ),
    );
  }
}

class RoomImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String info;

  RoomImage({required this.imagePath, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageInfoScreen(title: title, info: info),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}

class ImageInfoScreen extends StatelessWidget {
  final String title;
  final String info;

  ImageInfoScreen({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Image Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                info,
                style: TextStyle(fontSize: 18.0, color: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TypeOfRoom(),
  ));
}
