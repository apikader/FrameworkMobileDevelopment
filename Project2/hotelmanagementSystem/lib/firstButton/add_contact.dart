import 'package:flutter/material.dart';
import 'contact_list.dart';
import 'receipt.dart';
import 'package:app4/Drawer/room.dart';

class AddContact extends StatefulWidget {
  final List<Contact> contacts;
  final List<Room> rooms;

  AddContact({required this.contacts, required this.rooms});

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ICNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController roomTypeController = TextEditingController();
  final TextEditingController checkInDateController = TextEditingController();
  final TextEditingController checkOutDateController = TextEditingController();

  // Define room prices
  final Map<String, double> roomPrices = {
    'SingleRoom': 90.0,
    'DoubleRoom': 150.0,
    'TwinRoom': 180.0,
  };

  double totalPrice = 0.0;

  void calculateTotalPrice(String selectedRoomType) {
    setState(() {
      totalPrice = roomPrices[selectedRoomType] ?? 0.0;
    });
  }

  void submitData(BuildContext context) {
    final enteredName = nameController.text;
    final enteredICNumber = ICNumberController.text;
    final enteredPhoneNumber = phoneNumberController.text;
    final enteredRoomNumber = roomNumberController.text;
    final enteredRoomType = roomTypeController.text;
    final enteredCheckInDate = checkInDateController.text;
    final enteredCheckOutDate = checkOutDateController.text;

    if (enteredName.isNotEmpty &&
        enteredICNumber.isNotEmpty &&
        enteredPhoneNumber.isNotEmpty &&
        enteredRoomNumber.isNotEmpty &&
        enteredRoomType.isNotEmpty &&
        enteredCheckInDate.isNotEmpty &&
        enteredCheckOutDate.isNotEmpty) {
      Contact newContact = Contact(
        name: enteredName,
        ICNumber: enteredICNumber,
        phoneNumber: enteredPhoneNumber,
        roomNumber: enteredRoomNumber,
        roomType: enteredRoomType,
        checkInDate: enteredCheckInDate,
        checkOutDate: enteredCheckOutDate,
      );

      widget.contacts.add(newContact);

      // Calculate the total price based on the selected room type
      calculateTotalPrice(enteredRoomType);

      // Clear text fields
      nameController.clear();
      ICNumberController.clear();
      phoneNumberController.clear();
      roomNumberController.clear();
      roomTypeController.clear();
      checkInDateController.clear();
      checkOutDateController.clear();

      // Print contacts (for debugging purposes)
      print('Booking List: ${widget.contacts}');

      // Show a snackbar to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Booking successfully, Thank You'),
          duration: const Duration(seconds: 30), // Set duration
          action: SnackBarAction(
            label: 'View Receipt',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ReceiptPage(contact: widget.contacts.last);
                }),
              );
            },
          ),
        ),
      );
    }
  }

  Widget buildDateTextField({
    required String label,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.yellow),
      ),
      controller: controller,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );

        if (pickedDate != null && pickedDate != DateTime.now()) {
          String formattedDate =
              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          controller.text = formattedDate;
        }
      },
    );
  }

  // Admin function to add a new room
  void addRoom(String roomNumber, String roomType) {
    Room newRoom = Room(roomNumber: roomNumber, roomType: roomType);
    widget.rooms.add(newRoom);
    print('Room added: $newRoom');
  }

  // Admin function to delete a room
  void deleteRoom(String roomNumber) {
    widget.rooms.removeWhere((room) => room.roomNumber == roomNumber);
    print('Room deleted: $roomNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 81, 83),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 59, 61),
        title: const Text('Start Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Name:',
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  controller: nameController,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'IC Number:',
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  controller: ICNumberController,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number:',
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  controller: phoneNumberController,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Room Number:',
                    labelStyle: TextStyle(color: Colors.yellow),
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
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Room Type:',
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  value: roomTypeController.text.isNotEmpty
                      ? roomTypeController.text
                      : null,
                  items: ['SingleRoom', 'DoubleRoom', 'TwinRoom']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      roomTypeController.text = newValue;
                      // Update the total price when room type is selected
                      calculateTotalPrice(newValue);
                    }
                  },
                ),
                const SizedBox(height: 10.0),
                buildDateTextField(
                  label: 'Check-In Date:',
                  controller: checkInDateController,
                  context: context,
                ),
                const SizedBox(height: 10.0),
                buildDateTextField(
                  label: 'Check-Out Date:',
                  controller: checkOutDateController,
                  context: context,
                ),
                // SizedBox(height: 20),
                // // Display total price
                // Text(
                //   'Total Price: RM${totalPrice.toStringAsFixed(2)}',
                //   style: TextStyle(color: Colors.yellow),
                // ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      submitData(context);
                    },
                    child: Text('Pay RM${totalPrice.toStringAsFixed(2)}'),
                  ),
                ),

                // Admin controls
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Room Number:',
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  controller: roomNumberController,
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    // Example: Add a room
                    addRoom('R006', 'SingleRoom');
                  },
                  child: const Text('Add Room'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    // Example: Delete a room
                    deleteRoom('R006');
                  },
                  child: const Text('Delete Room'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
