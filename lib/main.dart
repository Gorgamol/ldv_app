import 'package:flutter/material.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/ldv_app.dart';

void main() {
  configureDependencies();
  runApp(const LdvApp());
}
