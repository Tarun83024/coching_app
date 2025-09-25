import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PurchasedCoursesScreen extends StatelessWidget {
  const PurchasedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchasedCourses = [
      {
        "title": "SSC CGL Tier-I Full Course",
        "thumbnail":
            "https://img.freepik.com/free-vector/online-certification-illustration_23-2148573630.jpg",
        "duration": "72 Lectures",
        "progress": 0.5,
      },
      {
        "title": "UPSC Prelims 2025 Crash Course",
        "thumbnail":
            "https://img.freepik.com/free-vector/studying-concept-illustration_114360-1603.jpg",
        "duration": "120 Lectures",
        "progress": 0.75,
      },
      {
        "title": "Bank PO Reasoning Masterclass",
        "thumbnail":
            "https://img.freepik.com/free-vector/flat-design-critical-thinking-concept_23-2149208326.jpg",
        "duration": "45 Lectures",
        "progress": 0.3,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Purchased Courses"),
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: purchasedCourses.length,
        itemBuilder: (context, index) {
          final course = purchasedCourses[index];
          return _buildCourseCard(course);
        },
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.network(
              course["thumbnail"],
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course["title"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Total: ${course["duration"]}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                LinearPercentIndicator(
                  lineHeight: 8,
                  percent: course["progress"],
                  backgroundColor: Colors.grey.shade300,
                  progressColor: Colors.blue.shade300,
                  barRadius: const Radius.circular(10),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Continue Learning"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
