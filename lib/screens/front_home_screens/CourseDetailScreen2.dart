import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CourseDetailScreen2 extends StatelessWidget {
  final String title;
  final String imagePath;
  final double rating;
  final String videos;
  final String price;

  const CourseDetailScreen2({
    super.key,
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.videos,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            Center(
              child: FadeIn(
                duration: const Duration(milliseconds: 400),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Rating and Video Count
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 4),
                Text(rating.toString(), style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                const Icon(Icons.play_circle_fill, color: Colors.grey),
                const SizedBox(width: 4),
                Text(videos, style: const TextStyle(fontSize: 14)),
              ],
            ),

            const SizedBox(height: 20),

            // Price at top
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Price: $price",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Course Includes Section
            const Text(
              "Course Includes",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _courseInfoCard(
              icon: Icons.access_time,
              title: "Duration",
              subtitle: "12 Months",
            ),
            _courseInfoCard(
              icon: Icons.language,
              title: "Language",
              subtitle: "Hindi / English",
            ),
            _courseInfoCard(
              icon: Icons.bar_chart,
              title: "Level",
              subtitle: "Beginner to Advanced",
            ),
            _courseInfoCard(
              icon: Icons.download,
              title: "Resources",
              subtitle: "PDF Notes, Practice Tests",
            ),

            const SizedBox(height: 24),

            // Course Description (at bottom)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Course Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This comprehensive course is designed to give you the edge in competitive exams. With high-quality video lectures, expert mentorship, and regular test series, you'll be thoroughly prepared for success.",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Enroll Button
            Center(
              child: BounceInUp(
                duration: const Duration(milliseconds: 800),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text("Enroll Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 64,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _courseInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black87)),
            ],
          )
        ],
      ),
    );
  }
}
