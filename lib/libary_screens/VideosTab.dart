import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Videostab extends StatefulWidget {
  const Videostab({super.key});

  @override
  State<Videostab> createState() => _VideostabState();
}

class _VideostabState extends State<Videostab> {
  List<Map<String, String>> offlineVideos = [
    {
      'title': 'Indian Polity - Fundamental Rights',
      'duration': '12 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'History - Revolt of 1857',
      'duration': '18 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Geography - Atmosphere Layers',
      'duration': '10 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Economy - Budget Basics',
      'duration': '15 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Indian Polity - Fundamental Rights',
      'duration': '12 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'History - Revolt of 1857',
      'duration': '18 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Geography - Atmosphere Layers',
      'duration': '10 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Economy - Budget Basics',
      'duration': '15 min',
      'thumbnail': 'assets/images/UPSC.jpg',
    },
  ];

  void _deleteVideo(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text("Remove Video"),
        content: const Text("Are you sure you want to Remove this video?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Remove", style: TextStyle(color: Colors.blue)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              setState(() {
                offlineVideos.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: offlineVideos.isEmpty
          ? const Center(
              child: Text(
                "No offline videos available.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: offlineVideos.length,
              itemBuilder: (context, index) {
                final video = offlineVideos[index];

                return FadeInLeft(
                  duration: Duration(milliseconds: 300 + index * 150),
                  child: GestureDetector(
                    onLongPress: () => _deleteVideo(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(16)),
                            child: Image.asset(
                              video['thumbnail']!,
                              width: 110,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video['title']!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time_rounded,
                                          size: 16, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(
                                        video['duration']!,
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.download_done_rounded,
                                          color: Colors.green, size: 18),
                                      const SizedBox(width: 4),
                                      const Text(
                                        "Downloaded",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.green),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
