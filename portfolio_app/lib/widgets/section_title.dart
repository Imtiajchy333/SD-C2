import 'package:flutter/material.dart';

import '../core/app_theme.dart';

/// Consistent heading style used before every section
/// (Skills, About, Projects, Let's Connect...).
class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppTheme.textDark,
      ),
    );
  }
}
