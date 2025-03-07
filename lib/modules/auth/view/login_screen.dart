import 'package:chikitsa/infrastructure/providers/auth_provider.dart';
import 'package:chikitsa/infrastructure/providers/internet_provider.dart';
import 'package:chikitsa/theme/widgets/custom_button.dart';
import 'package:chikitsa/modules/auth/widgets/email_input.dart';
import 'package:chikitsa/modules/auth/widgets/password_input.dart';
import 'package:chikitsa/theme/widgets/no_internet_popup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Consumer<InternetProvider>(
        builder: (context, provider, child) {
          if (!provider.isConnected) {
            Future.delayed(Duration.zero, () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const NoInternetPopup(),
              );
            });
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/health.jpg', height: 80),
                const SizedBox(height: 10),
                Text(
                  "Adhicine",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 125, 149, 218),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const EmailInput(),
                const SizedBox(height: 15),
                const PasswordInput(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(color: const Color.fromARGB(255, 125, 149, 218)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Sign In",
                  onPressed: () {
                    final provider = Provider.of<AuthProvider>(context, listen: false);

                    if (provider.validateForm()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  isOutlined: false,
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("OR")),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Continue with Google",
                  onPressed: () {},
                  isOutlined: true,
                  icon: "assets/images/google.png",
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Adhicine?", style: GoogleFonts.poppins()),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(color: const Color.fromARGB(255, 125, 149, 218)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
