import 'package:chikitsa/infrastructure/models/medicine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicineProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  // ✅ Ensure date format is always "YYYY-MM-DD"
  String get formattedSelectedDate => DateFormat('yyyy-MM-dd').format(_selectedDate);
  DateTime get selectedDate => _selectedDate;

  void updateDate(DateTime date) {
    _selectedDate = date;
    print("🔄 Selected Date: $formattedSelectedDate");
    notifyListeners();
  }

  // Initialize Medicine Data
  final Map<String, List<Medicine>> _medicineData = {};

  MedicineProvider() {
    _initializeDummyData();
  }

  void _initializeDummyData() {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    _medicineData[todayDate] = [
      Medicine(
        name: "Calpol 500mg Tablet",
        time: cleanTime("08:00 AM"),
        description: "Before Breakfast  Day 01",
        status: "Taken",
        icon: "assets/images/injection.jpg",
        statusColor: Colors.green,
      ),
      Medicine(
        name: "Calpol 500mg Tablet",
        time: cleanTime("02:00 PM"),
        description: "After Food  Day 01",
        status: "Snoozed",
        icon: "assets/images/capsule.jpg",
        statusColor: Colors.orange,
      ),
      Medicine(
        name: "Calpol 500mg Tablet",
        time: cleanTime("09:00 PM"),
        description: "Before Sleep  Day 03",
        status: "Left",
        icon: "assets/images/medicine.jpg",
        statusColor: Colors.grey,
      ),
    ];

    notifyListeners();
  }

  List<Medicine> get medicinesForSelectedDate {
    String dateKey = formattedSelectedDate;

    return _medicineData[dateKey] ?? [];
  }

  //Categorizing Medicines into Morning, Afternoon, and Night
  Map<String, List<Medicine>> get categorizedMedicines {
    List<Medicine> medicines = medicinesForSelectedDate;
    Map<String, List<Medicine>> categorized = {
      "Morning": [],
      "Afternoon": [],
      "Night": [],
    };

    for (var medicine in medicines) {
      try {
        String cleanedTime = cleanTime(medicine.time);
        DateTime medicineTime = DateFormat("h:mm a").parse(cleanedTime);
        int hour = medicineTime.hour;

        if (hour < 12) {
          categorized["Morning"]!.add(medicine);
        } else if (hour < 18) {
          categorized["Afternoon"]!.add(medicine);
        } else {
          categorized["Night"]!.add(medicine);
        }
      } catch (e) {
        print("❌ Error parsing time: '${medicine.time}' - $e");
      }
    }

    return categorized;
  }

  // Clean Time Strings
  static String cleanTime(String time) {
    return time.replaceAll("\u00A0", " ").replaceAll(RegExp(r'[^\x20-\x7E]'), '').trim();
  }
}
