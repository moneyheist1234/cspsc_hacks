import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startVideo});

  final void Function() startVideo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add 16 units of padding on all sides
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/images/start.png',
                width: 300,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Learn Cyber Scam Prevention in a Fun Way!',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: startVideo, // Trigger the video screen
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Start Here'),
              icon: const Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      ),
    );
  }
}
