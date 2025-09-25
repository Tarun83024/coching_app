import 'package:flutter/material.dart';

class MyDownloadsScreen extends StatelessWidget {
  const MyDownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> downloads = [
      {
        'title': 'Polity Notes (PDF)',
        'type': 'PDF Document',
        'size': '1.2 MB',
      },
      {
        'title': 'History Lecture - Ancient India',
        'type': 'Video File',
        'size': '250 MB',
      },
      {
        'title': 'Current Affairs – July 2025',
        'type': 'PDF Document',
        'size': '850 KB',
      },
      {
        'title': 'Quantitative Aptitude Practice Set',
        'type': 'PDF Document',
        'size': '2.1 MB',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("My Downloads"),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: downloads.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = downloads[index];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ListTile(
              leading: Icon(
                item['type']!.contains('PDF')
                    ? Icons.picture_as_pdf
                    : Icons.play_circle_fill,
                color: Colors.blueAccent,
                size: 34,
              ),
              title: Text(item['title']!, style: const TextStyle(fontSize: 16)),
              subtitle: Text("${item['type']} • ${item['size']}"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              onTap: () {
                // You can navigate or open the downloaded file here
              },
            ),
          );
        },
      ),
    );
  }
}
