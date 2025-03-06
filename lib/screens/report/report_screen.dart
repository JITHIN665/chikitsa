import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report')),
      body: Center(
        child: Text('Medicine Report', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
