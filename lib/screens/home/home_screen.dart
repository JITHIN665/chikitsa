import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../providers/medicine_provider.dart';
// import '../../widgets/medicine_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final medicines = Provider.of<MedicineProvider>(context).medicines;

    return Scaffold(
      // appBar: AppBar(title: const Text('Medicine Tracker')),
      // body: medicines.isEmpty
      //     ? const Center(child: Text('No medicines added'))
      //     : ListView.builder(
      //         itemCount: medicines.length,
      //         itemBuilder: (context, index) {
      //           return MedicineCard(medicine: medicines[index]);
      //         },
      //       ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pushNamed(context, '/addMedicine'),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
