// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class CompartmentSelectionWidget extends StatelessWidget {
  final AddMedicineProvider provider;

  const CompartmentSelectionWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Compartment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            int compartment = index + 1;
            bool isSelected = provider.selectedCompartment == compartment;
            return GestureDetector(
              onTap: () => provider.selectCompartment(compartment),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(
                    color: isSelected ? const Color.fromARGB(255, 125, 149, 218) : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$compartment",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
