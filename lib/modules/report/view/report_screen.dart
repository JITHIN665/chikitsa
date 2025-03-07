import 'package:chikitsa/infrastructure/models/medicine.dart';
import 'package:chikitsa/infrastructure/providers/medicine_provider.dart';
import 'package:chikitsa/modules/home/widgets/empty_state_widget.dart';
import 'package:chikitsa/modules/home/widgets/medicine_section_widget.dart';
import 'package:chikitsa/modules/report/widgets/calender_screen.dart';
import 'package:chikitsa/modules/report/widgets/check_dashbord_widget.dart';
import 'package:chikitsa/modules/report/widgets/report_summary_widget.dart';
import 'package:chikitsa/theme/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) => {},
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Report", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
      body: Consumer<MedicineProvider>(
        builder: (context, provider, child) {
          Map<String, List<Medicine>> categorizedMedicines = provider.categorizedMedicines;
          bool isEmpty =
              categorizedMedicines["Morning"]!.isEmpty && categorizedMedicines["Afternoon"]!.isEmpty && categorizedMedicines["Night"]!.isEmpty;

          return SingleChildScrollView(
            child: Column(
              children: [
                const ReportSummaryWidget(),
                const CheckDashboardWidget(),
                const SizedBox(height: 20),
                CalendarWidget(
                  onDateSelected: (selectedDate) {
                    provider.updateDate(selectedDate);
                  },
                ),
                const SizedBox(height: 10),
                isEmpty ? const EmptyStateWidget() : MedicineSectionsWidget(categorizedMedicines: categorizedMedicines),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
