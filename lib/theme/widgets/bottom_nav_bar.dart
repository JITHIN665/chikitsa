// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 243),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navBarItem(Icons.home, "Home", 0),
                const SizedBox(width: 60),
                navBarItem(Icons.bar_chart, "Report", 1),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.black,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget navBarItem(IconData icon, String label, int index) {
    bool isSelected = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () => {
        if (index == 0) {Navigator.pushReplacementNamed(context, '/home')} else if (index == 1) {Navigator.pushReplacementNamed(context, '/report')}
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? const Color.fromARGB(255, 125, 149, 218) : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color.fromARGB(255, 125, 149, 218) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double fabRadius = 30;
    double fabMargin = 10;
    double curveDepth = 20;

    Path path = Path()
      ..lineTo(size.width / 2 - (fabRadius + fabMargin), 0)
      ..quadraticBezierTo(size.width / 2 - fabRadius, curveDepth, size.width / 2, curveDepth)
      ..quadraticBezierTo(size.width / 2 + fabRadius, curveDepth, size.width / 2 + (fabRadius + fabMargin), 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
