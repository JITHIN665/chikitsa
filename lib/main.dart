import 'package:chikitsa/screens/home/add_medicine_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/report/report_screen.dart';
// import 'screens/medicine/add_medicine_screen.dart';
import 'screens/settings/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginScreen(),
      routes: {
        '/home': (context) =>  HomeScreen(),
        '/report': (context) =>  ReportScreen(),
        '/addMedicine': (context) =>  AddMedicineScreen(),
        '/settings': (context) =>  SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
