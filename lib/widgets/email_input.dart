import 'package:chikitsa/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Icon(Icons.alternate_email, color: provider.emailError != null && provider.emailError!.isNotEmpty ? Colors.red : Colors.teal),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: provider.setEmail,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Email",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        if (provider.emailError != null && provider.emailError!.isNotEmpty)
          Text(
            provider.emailError!,
            style: const TextStyle(color: Colors.red, fontSize: 14),
          ),
      ],
    );
  }
}
