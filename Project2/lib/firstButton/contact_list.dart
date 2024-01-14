import 'package:flutter/material.dart';
// import 'package:app2/firstButton/checkincheckout.dart';
// import 'package:app2/firstButton/add_contact.dart';
// import 'package:app2/firstButton/contact_list.dart';
// import 'package:app2/firstButton/typeOfRoom.dart';

class Contact {
  final String name;
  final String ICNumber;
  final String phoneNumber;
  final String roomNumber;
  final String roomType;
  final String checkInDate;
  final String checkOutDate;

  Contact({
    required this.name,
    required this.ICNumber,
    required this.phoneNumber,
    required this.roomNumber,
    required this.roomType,
    required this.checkInDate,
    required this.checkOutDate,
  });
}

class ContactListPage extends StatefulWidget {
  final List<Contact> contacts;

  ContactListPage({required this.contacts});

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 59, 61),
        title: Text('Booking List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ExpansionTile(
                title: Text(widget.contacts[index].roomNumber),
                subtitle: Text(widget.contacts[index].roomType),
                children: [
                  ListTile(
                    title:
                        Text('CheckIn: ${widget.contacts[index].checkInDate}'),
                  ),
                  ListTile(
                    title: Text(
                        'CheckOut: ${widget.contacts[index].checkOutDate}'),
                  ),
                ],
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // TODO: Implement logic to delete the contact
                    setState(() {
                      widget.contacts.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
