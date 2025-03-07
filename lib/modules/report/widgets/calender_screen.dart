import 'package:chikitsa/infrastructure/providers/medicine_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CalendarWidget({super.key, required this.onDateSelected});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<DateTime> lastSevenDays = List.generate(
      7,
      (index) => DateTime.now().subtract(Duration(days: 6 - index)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Check History", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: lastSevenDays.map((date) {
              bool isSelected = DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(selectedDate);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                  widget.onDateSelected(date);
                  Provider.of<MedicineProvider>(context, listen: false).updateDate(date);
                },
                child: Column(
                  children: [
                    Text(DateFormat('E').format(date), style: const TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 5),
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color.fromARGB(255, 125, 149, 218) : Colors.blue.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        DateFormat('d').format(date),
                        style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
