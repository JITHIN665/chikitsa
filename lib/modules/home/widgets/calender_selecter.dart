// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarSelector extends StatefulWidget {
  final Function(DateTime) onDateChanged; 
  const CalendarSelector({super.key, required this.onDateChanged});

  @override
  _CalendarSelectorState createState() => _CalendarSelectorState();
}

class _CalendarSelectorState extends State<CalendarSelector> {
  DateTime selectedDate = DateTime.now(); 

  void _changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });

    widget.onDateChanged(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    DateTime previousDate = selectedDate.subtract(const Duration(days: 1));
    DateTime nextDate = selectedDate.add(const Duration(days: 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('E').format(previousDate),
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.chevron_left, color: Color.fromARGB(255, 125, 149, 218)),
          onPressed: () => _changeDate(-1),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3D3D),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            DateFormat('EEEE, MMM d').format(selectedDate),
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: Color.fromARGB(255, 125, 149, 218)),
          onPressed: () => _changeDate(1),
        ),
        const SizedBox(width: 8),
        Text(
          DateFormat('E').format(nextDate),
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
