import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String infoText;

  const InfoTextWidget({super.key, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(200), // Use withAlpha (255 * 0.7 ≈ 178.5, so 180 is a close approximation)
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        infoText,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
