import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Courseplanscreen extends StatefulWidget {
  const Courseplanscreen({super.key});

  @override
  State<Courseplanscreen> createState() => _CourseplanscreenState();
}

class _CourseplanscreenState extends State<Courseplanscreen> {
  final List<Map<String, dynamic>> myCourses = [
    {
      "title": "UPSC Prelims 2025",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.7,
      "videos": "150+ Videos",
      "instructor": "Dr. Ajay Sharma"
    },
    {
      "title": "Law Optional - Paper I",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.45,
      "videos": "70+ Videos",
      "instructor": "Prof. Neha Verma"
    },
    {
      "title": "Indian Polity Special",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.9,
      "videos": "90+ Videos",
      "instructor": "Ravi Raj"
    },
    {
      "title": "Indian Polity Special",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.9,
      "videos": "80+ Videos",
      "instructor": "Ravi Raj"
    },
    {
      "title": "Indian Polity Special",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.9,
      "videos": "20+ Videos",
      "instructor": "Ravi Raj"
    },
    {
      "title": "Indian Polity Special",
      "image": "assets/images/UPSC.jpg",
      "progress": 0.9,
      "videos": "20+ Videos",
      "instructor": "Ravi Raj"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: myCourses.length,
          itemBuilder: (context, index) {
            final course = myCourses[index];
            return FadeInUp(
              duration: Duration(milliseconds: 300 + index * 100),
              child: _buildCourseCard(course),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              course["image"],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "By ${course["instructor"]}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.play_circle_fill,
                          size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(course["videos"],
                          style: const TextStyle(fontSize: 12)),
                      const Spacer(),
                      Text(
                        "${(course['progress'] * 100).toInt()}% Completed",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: course["progress"],
                    color: Colors.blue,
                    backgroundColor: Colors.grey.shade300,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
