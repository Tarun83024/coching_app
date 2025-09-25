import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Downloadstatustab extends StatefulWidget {
  const Downloadstatustab({super.key});

  @override
  State<Downloadstatustab> createState() => _DownloadstatustabState();
}

class _DownloadstatustabState extends State<Downloadstatustab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> downloadedVideos = [
    {
      'title': 'History Class – Ancient India',
      'size': '150 MB',
      'time': '2 hours ago',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Polity Lecture – Fundamental Rights',
      'size': '120 MB',
      'time': 'Yesterday',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'History Class – Ancient India',
      'size': '150 MB',
      'time': '2 hours ago',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Polity Lecture – Fundamental Rights',
      'size': '120 MB',
      'time': 'Yesterday',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'History Class – Ancient India',
      'size': '150 MB',
      'time': '2 hours ago',
      'image': 'assets/images/UPSC.jpg',
    },
    {
      'title': 'Polity Lecture – Fundamental Rights',
      'size': '120 MB',
      'time': 'Yesterday',
      'image': 'assets/images/UPSC.jpg',
    },
  ];

  final List<Map<String, String>> downloadedPDFs = [
    {
      'title': 'Modern History Notes',
      'size': '4.5 MB',
      'time': 'Today',
      'image': 'assets/icons/pdf.png',
    },
    {
      'title': 'Polity Constitution Chart',
      'size': '2.1 MB',
      'time': '3 days ago',
      'image': 'assets/icons/pdf.png',
    },
    {
      'title': 'Modern History Notes',
      'size': '4.5 MB',
      'time': 'Today',
      'image': 'assets/icons/pdf.png',
    },
    {
      'title': 'Polity Constitution Chart',
      'size': '2.1 MB',
      'time': '3 days ago',
      'image': 'assets/icons/pdf.png',
    },
    {
      'title': 'Modern History Notes',
      'size': '4.5 MB',
      'time': 'Today',
      'image': 'assets/icons/pdf.png',
    },
    {
      'title': 'Polity Constitution Chart',
      'size': '2.1 MB',
      'time': '3 days ago',
      'image': 'assets/icons/pdf.png',
    },
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget buildItem({
    required String image,
    required String title,
    required String size,
    required String time,
    required int index,
  }) {
    return FadeInRight(
      duration: Duration(milliseconds: 300 + index * 100),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
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
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$size • $time',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom TabBar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 1, bottom: 12),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: "Videos"),
                  Tab(text: "PDFs"),
                ],
              ),
            ],
          ),
        ),

        // TabBar content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Videos Tab
              ListView.builder(
                itemCount: downloadedVideos.length,
                itemBuilder: (context, index) {
                  final item = downloadedVideos[index];
                  return buildItem(
                    image: item['image']!,
                    title: item['title']!,
                    size: item['size']!,
                    time: item['time']!,
                    index: index,
                  );
                },
              ),

              // PDFs Tab
              ListView.builder(
                itemCount: downloadedPDFs.length,
                itemBuilder: (context, index) {
                  final item = downloadedPDFs[index];
                  return buildItem(
                    image: item['image']!,
                    title: item['title']!,
                    size: item['size']!,
                    time: item['time']!,
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
