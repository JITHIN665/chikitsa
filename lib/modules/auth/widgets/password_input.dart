import 'package:chikitsa/infrastructure/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Icon(Icons.lock, color: provider.passwordError != null && provider.passwordError!.isNotEmpty ? Colors.red : Colors.teal),
            ),
            Expanded(
              child: TextField(
                onChanged: provider.setPassword,
                obscureText: !provider.isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      provider.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: provider.passwordError != null && provider.passwordError!.isNotEmpty ? Colors.red : Colors.teal,
                    ),
                    onPressed: provider.togglePasswordVisibility,
                  ),
                  labelText: "Password",
                  // errorText: provider.passwordError,
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        if (provider.passwordError != null && provider.passwordError!.isNotEmpty)
          Text(
            provider.passwordError!,
            style: const TextStyle(color: Colors.red, fontSize: 14),
          ),
      ],
    );
  }
}
