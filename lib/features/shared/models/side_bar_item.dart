import 'package:flutter/material.dart';

class SideBarItem {
  const SideBarItem({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final Widget icon;
  final bool active;
  final VoidCallback onTap;
}
