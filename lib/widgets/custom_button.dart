import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final String? icon;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.icon,
    this.color = const Color.fromARGB(255, 125, 149, 218),
  });

  @override
  Widget build(BuildContext context) {
    return isOutlined ? outlinedButton() : filledButton();
  }

  Widget filledButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: buttonContent(),
    );
  }

  Widget outlinedButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: buttonContent(),
    );
  }

  Widget buttonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(icon!),
          ),
        if (icon != null) const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isOutlined ? color : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
