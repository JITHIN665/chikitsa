// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

import 'report_stat_widget.dart'; 

class ReportSummaryWidget extends StatelessWidget {
  const ReportSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), 
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3), 
            ),
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReportStatWidget(value: "5", label: "Total"),
                ReportStatWidget(value: "3", label: "Taken"),
                ReportStatWidget(value: "1", label: "Missed"),
                ReportStatWidget(value: "1", label: "Snoozed"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
