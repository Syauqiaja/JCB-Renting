import 'package:flutter/material.dart';
import 'package:jcb_renting/ui/login_screen.dart';
import 'package:jcb_renting/ui/register_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RegisterScreen()
        ),
      ),
    );
  }
}
