import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../core/app_theme.dart';

/// Animated, tappable profile picture.
/// Falls back to an initials avatar if the asset image fails to load,
/// instead of leaving a blank circle.
class ProfileAvatar extends StatelessWidget {
  final HomeController controller;

  const ProfileAvatar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.toggleAnimation,
      child: Obx(
        () {
          final size = controller.animate.value ? 180.0 : 140.0;
          final borderColor =
              controller.animate.value ? AppTheme.secondary : AppTheme.primary;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutBack,
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 4),
              boxShadow: [
                BoxShadow(
                  color: borderColor.withValues(alpha: 0.35),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: controller.avatarFailed.value
                  ? _fallback()
                  : Image.asset(
                      "assets/images/imti.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Defer the state update until after this frame.
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => controller.onAvatarError(),
                        );
                        return _fallback();
                      },
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _fallback() {
    return Container(
      color: AppTheme.primary.withValues(alpha: 0.1),
      alignment: Alignment.center,
      child: const Icon(Icons.person, size: 56, color: AppTheme.primary),
    );
  }
}
