import 'package:flutter/material.dart';
import 'contact_list.dart';

class AddContact extends StatelessWidget {
  final List<Contact> contacts;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController matricNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  AddContact({required this.contacts});

  void submitData(BuildContext context) {
    final enteredName = nameController.text;
    final enteredMatricNumber = matricNumberController.text;
    final enteredPhoneNumber = phoneNumberController.text;

    if (enteredName.isNotEmpty &&
        enteredMatricNumber.isNotEmpty &&
        enteredPhoneNumber.isNotEmpty) {
      Contact newContact = Contact(
        name: enteredName,
        matricNumber: enteredMatricNumber,
        phoneNumber: enteredPhoneNumber,
      );

      contacts.add(newContact);

      // Clear text fields
      nameController.clear();
      matricNumberController.clear();
      phoneNumberController.clear();

      // Print contacts (for debugging purposes)
      print('Contacts List: $contacts');

      // Show a snackbar to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Contact added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 212, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 29, 183),
        title: Text('CreateContact'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text field for Name
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name:',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                controller: nameController,
              ),
              SizedBox(height: 10.0),

              // Text field for Matric Number
              TextField(
                decoration: InputDecoration(
                  labelText: 'Matric Number:',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                controller: matricNumberController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),

              // Text field for Phone Number
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number:',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                controller: phoneNumberController,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0), // Adjust padding as needed
                    backgroundColor: Color.fromARGB(255, 119, 29, 183),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {
                    submitData(context);
                  },
                  child: Text('ADD CONTACT'),
                ),
              ),

              // Button for navigation to the 'About' screen
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0), // Adjust padding as needed
                    backgroundColor: Color.fromARGB(255, 119, 29, 183),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {
                    submitData(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ContactListPage(contacts: contacts);
                      }),
                    );
                  },
                  child: Text('VIEW CONTACTS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
