
import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String time;
  final String status;
  final String description;
  final String icon;
  final Color statusColor;

  Medicine({
    required this.name,
    required this.time,
    required this.status,
    required this.description,
    required this.icon,
    required this.statusColor,
  });
}