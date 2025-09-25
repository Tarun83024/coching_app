import 'package:flutter/material.dart';

class Coursesscreen extends StatefulWidget {
  const Coursesscreen({super.key});

  @override
  State<Coursesscreen> createState() => _CoursesscreenState();
}

class _CoursesscreenState extends State<Coursesscreen> {
  List<String> courseTitles = [
    "IAS (UPSC)",
    "HPSC (Haryana Public Service Commision)",
    "RAS",
    "Assistant Professor (College Education)",
    "राजस्थान पुलिस",
    "स्कूल व्याख्याता",
    "2nd Grade Teacher",
    "Lab Assistant",
    "3rd Grade Teacher (L1 & L2)",
    "ग्राम विकास अधिकारी(VDO)",
    "REET (पात्रता परीक्षा )",
    "RPSC RO and EO",
    "PTI (Physical Training Instructors)",
    "NET/JRF/SET",
    "SSC Exam",
    "Delhi Police Constable",
    "CET (Common Eligibility Test)",
    "Rajasthan High Court",
    "Computer (संगणक)",
    "Jr. Accountant",
    "Patwar",
    "CUET UG - PG",
  ];

  List<bool> isExpandedList = [];

  @override
  void initState() {
    super.initState();
    isExpandedList = List.generate(courseTitles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        title: const Text(
          "Courses",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: courseTitles.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ExpansionTile(
              title: Text(
                courseTitles[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                isExpandedList[index]
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      _buildCourseCard(
                        imagePath: 'assets/images/UPSC.jpg',
                        title: 'IAS Foundation GS',
                        rating: 4.2,
                        videos: '260+ Videos',
                        price: '₹94,000',
                      ),
                      const SizedBox(height: 12),
                      _buildCourseCard(
                        imagePath: 'assets/images/UPSC.jpg',
                        title: 'Law Optional Paper I',
                        rating: 4.9,
                        videos: '25+ Videos',
                        price: '₹9,440',
                      ),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpandedList[index] = expanded;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseCard({
    required String imagePath,
    required String title,
    required double rating,
    required String videos,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.play_circle_fill,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      videos,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
