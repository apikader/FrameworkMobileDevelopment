import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String matricNumber;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.matricNumber,
    required this.phoneNumber,
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
      backgroundColor: Color.fromARGB(255, 219, 212, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 29, 183),
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ExpansionTile(
                title: Text(widget.contacts[index].name),
                children: [
                  ListTile(
                    title: Text(
                        'Matric Number: ${widget.contacts[index].matricNumber}'),
                  ),
                  ListTile(
                    title: Text(
                        'Phone Number: ${widget.contacts[index].phoneNumber}'),
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
