import 'package:flutter/material.dart';

class Mentor {
  final String name;
  final String expertise;
  final String bio;
  final IconData icon;

  Mentor({
    required this.name,
    required this.expertise,
    required this.bio,
    required this.icon,
  });
}

class MentorshipScreen extends StatelessWidget {
  const MentorshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Mentor> mentors = [
      Mentor(
        name: 'Dr. Sarah Johnson',
        expertise: 'Data Science & AI',
        bio: 'PhD in Machine Learning, 10+ years mentoring students in AI research.',
        icon: Icons.computer,
      ),
      Mentor(
        name: 'Mr. David Lee',
        expertise: 'Software Engineering',
        bio: 'Senior developer at TechNova, passionate about clean code and scalable systems.',
        icon: Icons.code,
      ),
      Mentor(
        name: 'Ms. Rachel Green',
        expertise: 'Business & Entrepreneurship',
        bio: 'Startup founder and business coach helping young entrepreneurs thrive.',
        icon: Icons.business_center,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Mentorship'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Your Mentor 👩‍🏫',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Connect with experienced mentors for guidance in academics, skills, and career growth.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mentors.length,
                itemBuilder: (context, index) {
                  final mentor = mentors[index];
                  return MentorCard(mentor: mentor);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({required this.mentor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(mentor.icon, color: Colors.blue[800]),
        ),
        title: Text(
          mentor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${mentor.expertise}\n${mentor.bio}'),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Book Session with ${mentor.name}'),
                content: const Text('Would you like to schedule a mentorship session?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Session booked with ${mentor.name}!')),
                      );
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800]),
          child: const Text('Book'),
        ),
      ),
    );
  }
}
