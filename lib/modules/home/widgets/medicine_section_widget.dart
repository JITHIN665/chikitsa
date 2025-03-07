import 'package:chikitsa/infrastructure/models/medicine.dart';
import 'package:chikitsa/modules/home/widgets/medicine_card.dart';
import 'package:flutter/material.dart';

class MedicineSectionsWidget extends StatelessWidget {
  final Map<String, List<Medicine>> categorizedMedicines;

  const MedicineSectionsWidget({
    super.key,
    required this.categorizedMedicines,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        if (categorizedMedicines["Morning"]?.isNotEmpty ?? false) ...[
          buildSectionHeader("Morning 08:00 AM"),
          ...categorizedMedicines["Morning"]!.map((medicine) => MedicineCard(medicine: medicine)),
        ],
        if (categorizedMedicines["Afternoon"]?.isNotEmpty ?? false) ...[
          buildSectionHeader("Afternoon 02:00 PM"),
          ...categorizedMedicines["Afternoon"]!.map((medicine) => MedicineCard(medicine: medicine)),
        ],
        if (categorizedMedicines["Night"]?.isNotEmpty ?? false) ...[
          buildSectionHeader("Night 09:00 PM"),
          ...categorizedMedicines["Night"]!.map((medicine) => MedicineCard(medicine: medicine)),
        ],
      ],
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
