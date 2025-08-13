import 'package:flutter/material.dart';

class CareerScreen extends StatelessWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CareerTip> tips = [
      CareerTip(
        title: 'Build a Strong Resume',
        description: 'Highlight your skills, projects, and achievements clearly.',
        icon: Icons.description,
      ),
      CareerTip(
        title: 'Practice Interview Skills',
        description: 'Prepare for common questions and build confidence.',
        icon: Icons.record_voice_over,
      ),
      CareerTip(
        title: 'Explore Internships',
        description: 'Gain experience through real-world projects and mentorship.',
        icon: Icons.work_outline,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text('Career'),
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Career Growth 🚀',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple[900],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Explore tips and resources to help you prepare for your future.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple[700],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  final tip = tips[index];
                  return CareerCard(tip: tip);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CareerTip {
  final String title;
  final String description;
  final IconData icon;

  CareerTip({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class CareerCard extends StatelessWidget {
  final CareerTip tip;

  const CareerCard({required this.tip, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(tip.icon, size: 40, color: Colors.purple[800]),
        title: Text(
          tip.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(tip.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Future: Navigate to detailed resource or external link
        },
      ),
    );
  }
}
