import 'package:chikitsa/infrastructure/models/medicine.dart';
import 'package:chikitsa/infrastructure/providers/medicine_provider.dart';
import 'package:chikitsa/modules/home/widgets/empty_state_widget.dart';
import 'package:chikitsa/modules/home/widgets/medicine_section_widget.dart';
import 'package:chikitsa/theme/widgets/bottom_nav_bar.dart';
import 'package:chikitsa/modules/home/widgets/calender_selecter.dart';
import 'package:chikitsa/modules/home/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Harry!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("5 Medicines Left", style: TextStyle(fontSize: 14, color: Colors.black)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.medical_services, color: Color.fromARGB(255, 125, 149, 218)),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () => {Navigator.pushNamed(context, '/settings')},
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage("assets/images/care_1.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addMedicine');
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Consumer<MedicineProvider>(builder: (context, provider, child) {
        Map<String, List<Medicine>> categorizedMedicines = provider.categorizedMedicines;
        bool isEmpty =
            categorizedMedicines["Morning"]!.isEmpty && categorizedMedicines["Afternoon"]!.isEmpty && categorizedMedicines["Night"]!.isEmpty;
        return Column(
          children: [
            CalendarSelector(
              onDateChanged: (selectedDate) {
                provider.updateDate(selectedDate);
              },
            ),
            const SizedBox(height: 20),
            isEmpty ? const EmptyStateWidget() : MedicineSectionsWidget(categorizedMedicines: categorizedMedicines),
          ],
        );
      }),
    );
  }

  Widget buildMedicineSections(Map<String, List<Medicine>> categorizedMedicines) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          if (categorizedMedicines["Morning"]!.isNotEmpty) ...[
            buildSectionHeader("Morning 08:00 AM"),
            ...categorizedMedicines["Morning"]!.map((medicine) => MedicineCard(medicine: medicine)),
          ],
          if (categorizedMedicines["Afternoon"]!.isNotEmpty) ...[
            buildSectionHeader("Afternoon 02:00 PM"),
            ...categorizedMedicines["Afternoon"]!.map((medicine) => MedicineCard(medicine: medicine)),
          ],
          if (categorizedMedicines["Night"]!.isNotEmpty) ...[
            buildSectionHeader("Night 09:00 PM"),
            ...categorizedMedicines["Night"]!.map((medicine) => MedicineCard(medicine: medicine)),
          ],
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  Widget buildEmptyState() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset("assets/icons/no_data.png", height: 200),
            const Text("Nothing Is Here, Add a Medicine", style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
