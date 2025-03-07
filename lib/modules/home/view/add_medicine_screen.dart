import 'package:flutter/material.dart';

class AddMedicineScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Medicine Name')),
            TextField(controller: timeController, decoration: InputDecoration(labelText: 'Time')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save medicine logic here
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
