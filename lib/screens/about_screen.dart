import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<String> skills = [
    "Problem Solving",
    "Attenttion to details",
    "Software Testing",
    "Communication",
    "Programmimg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1521566652839-697aa473761a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(child: Text("Emily Clark")),
            const Text(
              "Skills",
            ),
            for (int i = 0; i < skills.length; i++)
              Text("${i + 1} ${skills[i]}")
          ],
        ),
      ),
    );
  }
}
