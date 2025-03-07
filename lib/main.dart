import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chikitsa/infrastructure/providers/auth_provider.dart';
import 'package:chikitsa/infrastructure/providers/medicine_provider.dart';
import 'package:chikitsa/infrastructure/providers/add_medicine_provider.dart';
import 'package:chikitsa/infrastructure/providers/internet_provider.dart';
import 'package:chikitsa/modules/auth/view/login_screen.dart';
import 'package:chikitsa/modules/home/view/home_screen.dart';
import 'package:chikitsa/modules/report/view/report_screen.dart';
import 'package:chikitsa/modules/settings/view/settings_screen.dart';
import 'package:chikitsa/modules/add_medicine/views/add_medicine_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MedicineProvider()),
        ChangeNotifierProvider(create: (_) => AddMedicineProvider()),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/report': (context) => const ReportScreen(),
        '/addMedicine': (context) => AddMedicineScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
