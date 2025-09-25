import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Testseriesplanscreen extends StatefulWidget {
  const Testseriesplanscreen({super.key});

  @override
  State<Testseriesplanscreen> createState() => _TestseriesplanscreenState();
}

class _TestseriesplanscreenState extends State<Testseriesplanscreen> {
  final List<Map<String, dynamic>> testSeries = [
    {
      'title': 'UPSC Prelims Full Length Test',
      'subject': 'General Studies',
      'tests': '10 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'SSC CGL Tier I Mock Test',
      'subject': 'Quant + Reasoning',
      'tests': '5 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Banking Exam Series',
      'subject': 'Aptitude + English',
      'tests': '8 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'UPSC Prelims Full Length Test',
      'subject': 'General Studies',
      'tests': '10 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'SSC CGL Tier I Mock Test',
      'subject': 'Quant + Reasoning',
      'tests': '5 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Banking Exam Series',
      'subject': 'Aptitude + English',
      'tests': '8 Tests',
      'image': 'assets/images/UPSC.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: testSeries.isEmpty
          ? const Center(child: Text("No test series purchased."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: testSeries.length,
              itemBuilder: (context, index) {
                final series = testSeries[index];
                return FadeInUp(
                  duration: Duration(milliseconds: 300 + index * 150),
                  child: Hero(
                    tag: 'testSeries${index}',
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(18)),
                              child: Image.asset(
                                series['image'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      series['title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      series['subject'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_circle_outline,
                                            color: Colors.green, size: 18),
                                        const SizedBox(width: 4),
                                        Text(series['tests'],
                                            style:
                                                const TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
