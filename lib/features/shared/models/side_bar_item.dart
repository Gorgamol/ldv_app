import 'package:flutter/material.dart';

class SideBarItem {
  const SideBarItem({
    required this.icon,
    required this.active,
    required this.onTap,
    this.title,
  });

  final Widget icon;
  final bool active;
  final VoidCallback onTap;
  final String? title;
}
