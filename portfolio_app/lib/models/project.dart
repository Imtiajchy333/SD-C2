import 'package:flutter/material.dart';

/// Represents a single portfolio project.
/// Kept as a model instead of hardcoded widgets so adding a new
/// project later is a one-line change in the controller.
class Project {
  final String title;
  final String url;
  final IconData icon;
  final Color color;

  const Project({
    required this.title,
    required this.url,
    required this.icon,
    required this.color,
  });
}
