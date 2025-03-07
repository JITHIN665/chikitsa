// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class DateSelectionWidget extends StatelessWidget {
  final AddMedicineProvider provider;
  final BuildContext context;

  const DateSelectionWidget({Key? key, required this.provider, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDateField("Start Date", provider.formatDate(provider.startDate), () => provider.updateStartDate(context)),
        const SizedBox(width: 10),
        _buildDateField("End Date", provider.formatDate(provider.endDate), () => provider.updateEndDate(context)),
      ],
    );
  }

  Widget _buildDateField(String label, String date, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(date, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
