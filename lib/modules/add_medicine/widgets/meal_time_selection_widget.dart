import 'package:flutter/material.dart';

class MealTimeSelectionWidget extends StatelessWidget {
  final String selectedMealTime;
  final List<String> mealTimes;
  final Function(String) onMealTimeSelected;

  const MealTimeSelectionWidget({
    super.key,
    required this.selectedMealTime,
    required this.mealTimes,
    required this.onMealTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Meal Time", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: mealTimes.map((mealTime) {
            bool isSelected = selectedMealTime == mealTime;
            return GestureDetector(
              onTap: () => onMealTimeSelected(mealTime),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color.fromARGB(255, 125, 149, 218) : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50),
                  border: isSelected ? Border.all(color: Colors.blue) : null,
                ),
                child: Text(
                  mealTime,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
