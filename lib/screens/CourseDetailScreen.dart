import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Coursedetailscreen extends StatefulWidget {
  final Map<String, dynamic> course;

  const Coursedetailscreen({super.key, required this.course});

  @override
  State<Coursedetailscreen> createState() => _CoursedetailscreenState();
}

class _CoursedetailscreenState extends State<Coursedetailscreen> {
  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(course['title']),
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white, // You can change color if needed
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Course Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                course['image'],
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            /// Title & Subtitle
            Text(
              course['title'],
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 8),
            if (course.containsKey('subtitle'))
              Text(
                course['subtitle'],
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),

            const SizedBox(height: 16),

            /// Rating, Videos, Price Box
            Row(
              children: [
                _iconText(Icons.star, "${course['rating']}", Colors.orange),
                const SizedBox(width: 16),
                if (course.containsKey('videos'))
                  _iconText(Icons.play_circle_outline,
                      "${course['videos']} Videos", Colors.blue),
              ],
            ),
            const SizedBox(height: 16),
            if (course.containsKey('price'))
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Price: ₹${course['price']}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

            const SizedBox(height: 24),

            /// Course Details Section
            const Text(
              "Course Includes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _featureTile(Icons.schedule, "Duration", "12 Months"),
            _featureTile(Icons.language, "Language", "Hindi / English"),
            _featureTile(Icons.bar_chart, "Level", "Beginner to Advanced"),
            _featureTile(
                Icons.download, "Resources", "PDF Notes, Practice Tests"),

            const SizedBox(height: 30),

            /// Enroll Now Button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Enroll functionality coming soon!")),
                  );
                },
                //icon: const Icon(Icons.check_circle_outline,),
                label: const Text("Enroll Now",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _featureTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
              Text(subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}
