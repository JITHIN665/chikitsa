// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class TypeSelectionWidget extends StatelessWidget {
  final AddMedicineProvider provider;

  const TypeSelectionWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> types = [
      {"label": "Liquid", "icon": "assets/icons/liq.png"},
      {"label": "Ointment", "icon": "assets/icons/ointment.png"},
      {"label": "capsule", "icon": "assets/icons/cap.png"},
      {"label": "Tablet", "icon": "assets/icons/tab.png"},
      {"label": "Injection", "icon": "assets/icons/injection.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: types.map((type) {
              bool isSelected = provider.selectedType == type["label"];
              return GestureDetector(
                onTap: () => provider.selectType(type["label"]),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.grey.shade200,
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        type["icon"],
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        type["label"],
                        style: TextStyle(color: isSelected ? Colors.blue : Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
