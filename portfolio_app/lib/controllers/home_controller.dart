import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project.dart';

class HomeController extends GetxController {
  /// Drives the tap-to-animate effect on the profile card.
  final RxBool animate = false.obs;

  /// True if the profile picture failed to load, so the UI can
  /// fall back to a placeholder instead of a blank/broken image.
  final RxBool avatarFailed = false.obs;

  void toggleAnimation() => animate.value = !animate.value;

  void onAvatarError() => avatarFailed.value = true;

  // ---- Static content (kept here so the UI stays "dumb") ----

  final String name = "Imtiaj Chowdhury";
  final String title = "Flutter Developer | CSE Student";
  final String about =
      "I am a CSE student passionate about Flutter, React, Node.js and "
      "Mobile App Development. I enjoy building modern web and mobile "
      "applications.";

  final List<String> skills = const ["Flutter", "React", "Node.js", "MongoDB"];

  final String email = "imtiajchowdhury333@gmail.com";
  final String phone = "+8801834482584";
  final String location = "Chattogram, Bangladesh";

  final List<Project> projects = const [
    Project(
      title: "Expense Tracker",
      url: "https://track-expense-deploy-ready.vercel.app/login",
      icon: Icons.account_balance_wallet,
      color: Color(0xFF14B8A6),
    ),
    Project(
      title: "EV Charging Scheduler",
      url: "https://soft-fairy-a0d9e8.netlify.app/",
      icon: Icons.ev_station,
      color: Color(0xFF6366F1),
    ),
    Project(
      title: "Portfolio Website",
      url: "https://imtiajchy333.github.io/IMTIAJ-Portfolio/",
      icon: Icons.person,
      color: Color(0xFFF97316),
    ),
  ];

  // ---- Actions ----

  Future<void> openUrl(String url) => _launch(Uri.parse(url));

  Future<void> sendEmail() => _launch(Uri(scheme: 'mailto', path: email));

  Future<void> callPhone() => _launch(Uri(scheme: 'tel', path: phone));

  Future<void> openLocation() => _launch(
        Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}',
        ),
      );

  Future<void> _launch(Uri uri) async {
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok) {
        Get.snackbar(
          "Couldn't open",
          "No app found to handle this action.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (kDebugMode) debugPrint("Launch failed: $e");
      Get.snackbar(
        "Something went wrong",
        "Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
