import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../core/app_theme.dart';
import '../widgets/contact_section.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';
import '../widgets/skills_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
      ),
      body: SafeArea(
        child: Center(
          // Keeps content a readable width on tablet / web instead of
          // stretching edge-to-edge on large screens.
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                children: [
                  ProfileAvatar(controller: controller),
                  const SizedBox(height: 20),
                  Text(
                    controller.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton.icon(
                    onPressed: controller.sendEmail,
                    icon: const Icon(Icons.mail_outline),
                    label: const Text("Contact Me"),
                  ),
                  const SizedBox(height: 28),

                  SkillsCard(skills: controller.skills),
                  const SizedBox(height: 28),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: SectionTitle("About Me"),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        controller.about,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SectionTitle("Projects"),
                  ),
                  const SizedBox(height: 12),
                  ...controller.projects.map(
                    (project) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ProjectCard(
                        project: project,
                        onTap: () => controller.openUrl(project.url),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SectionTitle("Let's Connect"),
                  ),
                  const SizedBox(height: 12),
                  ContactSection(controller: controller),
                  const SizedBox(height: 28),

                  const Text(
                    "Thanks for Visiting ❤️",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "© 2026 Imtiaj Chowdhury",
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
