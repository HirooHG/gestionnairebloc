
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key});

  @override
  Color? get backgroundColor => const Color(0xFF1a1a1a);

  @override
  double? get elevation => 2.0;

  @override
  Color? get shadowColor => Colors.white;

  @override
  Widget? get title => const Text(
    "Gestionnaire",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "Ubuntu",
    ),
  );
}
