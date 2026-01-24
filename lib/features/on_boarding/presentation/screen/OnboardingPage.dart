import 'package:flutter/material.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingPage extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String body;

   OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        image.image(height: 300),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE2BE7F),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
