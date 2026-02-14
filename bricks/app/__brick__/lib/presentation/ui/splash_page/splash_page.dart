import 'package:flutter/material.dart';
import 'package:{{name.snakeCase}}/presentation/components/logo/logo.dart';
import 'package:{{name.snakeCase}}/presentation/shared/color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: UIColor.white,
        child: const Center(
          child: Logo(scale: 3.8),
        ),
      ),
    );
  }
}
