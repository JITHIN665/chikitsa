// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class TotalCountWidget extends StatelessWidget {
  final AddMedicineProvider provider;

  const TotalCountWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Count", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              provider.totalCount.toInt().toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            const Text("0"),
            Expanded(
              child: Slider(
                value: provider.totalCount,
                min: 0, 
                max: 100,
                divisions: 100,
                onChanged: provider.updateTotalCount,
              ),
            ),
            const Text("100"), 
          ],
        ),
      ],
    );
  }
}
