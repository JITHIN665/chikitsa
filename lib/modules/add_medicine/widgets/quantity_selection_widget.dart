// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class QuantitySelectionWidget extends StatelessWidget {
  final AddMedicineProvider provider;

  const QuantitySelectionWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Take 1/2 Pill",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: provider.decreaseQuantity,
                icon: const Icon(Icons.remove, color: Colors.black),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 125, 149, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: provider.increaseQuantity,
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
