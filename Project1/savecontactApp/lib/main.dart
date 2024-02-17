import 'package:flutter/material.dart';
import 'home.dart';
import 'add_contact.dart';
import 'contact_list.dart';
import 'first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/home': (context) => Home(contacts: contacts),
        '/first': (context) => AddContact(contacts: contacts),
        '/second': (context) => ContactListPage(contacts: contacts),
      },
    );
  }
}
