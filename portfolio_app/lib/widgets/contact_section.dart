import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

/// "Let's Connect" card with real, tappable contact actions
/// (mailto, tel, and maps) instead of static text.
class ContactSection extends StatelessWidget {
  final HomeController controller;

  const ContactSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            _tile(
              color: Colors.red,
              icon: Icons.email,
              title: "Email",
              subtitle: controller.email,
              onTap: controller.sendEmail,
            ),
            const Divider(height: 1),
            _tile(
              color: Colors.green,
              icon: Icons.phone,
              title: "Phone",
              subtitle: controller.phone,
              onTap: controller.callPhone,
            ),
            const Divider(height: 1),
            _tile(
              color: Colors.blue,
              icon: Icons.location_on,
              title: "Location",
              subtitle: controller.location,
              onTap: controller.openLocation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, size: 20),
    );
  }
}
