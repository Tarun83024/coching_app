import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Screenshotstab extends StatefulWidget {
  const Screenshotstab({super.key});

  @override
  State<Screenshotstab> createState() => _ScreenshotstabState();
}

class _ScreenshotstabState extends State<Screenshotstab> {
  final List<Map<String, String>> screenshots = [
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Polity Lecture Notes',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Geography Map Diagram',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Polity Lecture Notes',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Geography Map Diagram',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Polity Lecture Notes',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Geography Map Diagram',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Polity Lecture Notes',
    },
    {
      'image': 'assets/images/UPSC.jpg',
      'title': 'Geography Map Diagram',
    },
    // Add more if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: screenshots.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty_screenshot.png',
                    width: 180,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Screenshots Yet!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Take a screenshot from notes or videos\nto see them here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : GridView.builder(
              itemCount: screenshots.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final shot = screenshots[index];
                return ZoomIn(
                  duration: Duration(milliseconds: 400 + (index * 100)),
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 3,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        // TODO: View full screenshot or preview
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                shot['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.65),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Text(
                                  shot['title']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
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
