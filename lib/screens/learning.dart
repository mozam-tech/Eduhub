import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Course> courses = [
      Course(
        title: 'Flutter Basics',
        description: 'Learn widgets, layouts, and navigation.',
        icon: Icons.phone_android,
        progress: 0.6,
      ),
      Course(
        title: 'Dart Programming',
        description: 'Master variables, functions, and classes.',
        icon: Icons.code,
        progress: 0.3,
      ),
      Course(
        title: 'UI Design Principles',
        description: 'Explore color, typography, and layout.',
        icon: Icons.design_services,
        progress: 0.8,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Learning'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(course: course);
          },
        ),
      ),
    );
  }
}

class Course {
  final String title;
  final String description;
  final IconData icon;
  final double progress;

  Course({
    required this.title,
    required this.description,
    required this.icon,
    required this.progress,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({required this.course, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(course.icon, size: 32, color: Colors.blue[700]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      course.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      course.description,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: course.progress,
                      backgroundColor: Colors.blue[100],
                      color: Colors.blue[700],
                      minHeight: 6,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
