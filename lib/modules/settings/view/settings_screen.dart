import 'package:chikitsa/theme/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          flexibleSpace: const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/care_1.jpg"),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Take Care!", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text("Richa Bose", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SettingsItem(
              icon: Icons.notifications,
              title: "Notification",
              subtitle: "Check your medicine notification",
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.volume_up,
              title: "Sound",
              subtitle: "Ring, Silent, Vibrate",
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.person,
              title: "Manage Your Account",
              subtitle: "Password, Email ID, Phone Number",
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.notifications,
              title: "Notification",
              subtitle: "Check your medicine notification",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const Text("Device", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  DeviceOption(icon: Icons.wifi, title: "Connect", subtitle: "Bluetooth, Wi-Fi"),
                  SizedBox(height: 10),
                  DeviceOption(icon: Icons.volume_up, title: "Sound Option", subtitle: "Ring, Silent, Vibrate", isHighlighted: true),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Caretakers: 03", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CaretakerSection(),
            const SizedBox(height: 20),
            const Text("Doctor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const DoctorSection(),
            const SizedBox(height: 30),
            FooterSection(),
            const SizedBox(height: 30),
            CustomButton(
              text: "Log Out",
              onPressed: () {},
              isOutlined: true,
              color: Colors.black,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;

  const SettingsItem({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }
}

class DeviceOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isHighlighted;

  const DeviceOption({super.key, required this.icon, required this.title, required this.subtitle, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: isHighlighted
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
            )
          : null,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class CaretakerSection extends StatelessWidget {
  final List<String> caretakers = ["Dipa Luna", "Roz Sod..", "Sunny Tu.."];

  CaretakerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var caretaker in caretakers)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/care_2.jpeg"),
                  ),
                  Text(caretaker, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          const Column(
            children: [
              CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Icon(Icons.add, color: Colors.grey)),
              Text("Add", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.add, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 10),
          const Text("Add Your Doctor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Or use ", style: TextStyle(fontSize: 14, color: Colors.black)),
              GestureDetector(
                onTap: () {},
                child: const Text("invite link", style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  final List<String> links = ["Privacy Policy", "Terms of Use", "Rate Us", "Share"];

  FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: links
          .map((link) => InkWell(
                onTap: () => print(link),
                child: ListTile(
                  title: Text(link, style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ))
          .toList(),
    );
  }
}
