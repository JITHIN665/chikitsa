import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicineProvider with ChangeNotifier {
  // ✅ Compartment Selection
  int _selectedCompartment = 1;
  int get selectedCompartment => _selectedCompartment;
  void selectCompartment(int compartment) {
    _selectedCompartment = compartment;
    notifyListeners();
  }

  // ✅ Colour Selection
  Color _selectedColour = Colors.purple;
  Color get selectedColour => _selectedColour;
  void selectColour(Color colour) {
    _selectedColour = colour;
    notifyListeners();
  }

  // ✅ Type Selection
  String _selectedType = "Tablet";
  String get selectedType => _selectedType;
  void selectType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  // ✅ Quantity Selection
  int _quantity = 1;
  int get quantity => _quantity;
  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  // ✅ Total Count using Slider
  double _totalCount = 1;
  double get totalCount => _totalCount;
  void updateTotalCount(double value) {
    _totalCount = value;
    notifyListeners();
  }

  // ✅ Start & End Date Selection
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  void updateStartDate(BuildContext context) async {
    DateTime? picked = await _selectDate(context, _startDate);
    if (picked != null) {
      _startDate = picked;
      notifyListeners();
    }
  }

  void updateEndDate(BuildContext context) async {
    DateTime? picked = await _selectDate(context, _endDate);
    if (picked != null) {
      _endDate = picked;
      notifyListeners();
    }
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // ✅ Frequency of Days Selection
  String _selectedFrequency = "Everyday";
  String get selectedFrequency => _selectedFrequency;
  void selectFrequency(String frequency) {
    _selectedFrequency = frequency;
    notifyListeners();
  }

  // ✅ Number of Doses per Day Selection
  String _selectedDoseTimes = "Three Time";
  String get selectedDoseTimes => _selectedDoseTimes;
  void selectDoseTimes(String doseTimes) {
    _selectedDoseTimes = doseTimes;
    notifyListeners();
  }

  // ✅ Meal Time Selection
  String _selectedMealTime = "Before Food";
  String get selectedMealTime => _selectedMealTime;
  void selectMealTime(String mealTime) {
    _selectedMealTime = mealTime;
    notifyListeners();
  }
}
