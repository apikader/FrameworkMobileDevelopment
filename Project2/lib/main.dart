import 'package:app4/Drawer/login_page.dart';
import 'package:app4/firstButton/typeOfRoom.dart';
import 'package:flutter/material.dart';
import 'home.dart';

//Drawer
import 'package:app4/Drawer/login_page.dart';
import 'package:app4/Drawer/room.dart';
// First Button
import 'package:app4/firstButton/checkincheckout.dart';
import 'package:app4/firstButton/add_contact.dart';
import 'package:app4/firstButton/contact_list.dart';
import 'package:app4/firstButton/typeOfRoom.dart';
// Second Button
import 'secondButton/roomservice.dart';
// Third Button
import 'package:app4/thirdButton/housekeeping.dart';
// Fourth Button
import 'fourthButton/customerfeedback.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [];
    final List<Room> rooms = []; // Add this line to define 'rooms'

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
// Drawer
        '/login': (context) => LoginPage(),
// First Button
        '/firstButton': (context) => FirstButton(),
        '/second': (context) => ContactListPage(contacts: contacts),
        '/third': (context) => AddContact(contacts: contacts, rooms: rooms),
        '/forth': (context) => TypeOfRoom(),
// Second Button
        '/secondButton': (context) => RoomServiceScreen(),
// Third Button
        '/thirdButton': (context) => ThirdPage(),
// Forth Button
        '/fourthButton': (context) => FourthPage()
      },
    );
  }
}
