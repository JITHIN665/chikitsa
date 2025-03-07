// ignore_for_file: use_super_parameters

import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:flutter/material.dart';

class ColourSelectionWidget extends StatelessWidget {
  final AddMedicineProvider provider;

  const ColourSelectionWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.pink, Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.yellow];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Colour", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: colors.map((color) {
            bool isSelected = provider.selectedColour == color;
            return GestureDetector(
              onTap: () => provider.selectColour(color),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: color,
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
