import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Notestab extends StatefulWidget {
  const Notestab({super.key});

  @override
  State<Notestab> createState() => _NotestabState();
}

class _NotestabState extends State<Notestab> {
  final List<Map<String, String>> notes = [
    {'title': 'Polity Summary', 'size': '2.4 MB'},
    {'title': 'History Spectrum', 'size': '3.1 MB'},
    {'title': 'NCERT Geography', 'size': '1.8 MB'},
    {'title': 'Economy CA 2024', 'size': '2.9 MB'},
    {'title': 'Ethics Case Studies', 'size': '1.5 MB'},
    {'title': 'Env & Ecology Notes', 'size': '2.2 MB'},
    {'title': 'Polity Summary', 'size': '2.4 MB'},
    {'title': 'History Spectrum', 'size': '3.1 MB'},
    {'title': 'NCERT Geography', 'size': '1.8 MB'},
    {'title': 'Economy CA 2024', 'size': '2.9 MB'},
    {'title': 'Ethics Case Studies', 'size': '1.5 MB'},
    {'title': 'Env & Ecology Notes', 'size': '2.2 MB'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F8FC),
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.2 / 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final note = notes[index];

          return FadeInUp(
            duration: Duration(milliseconds: 250 + index * 100),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/pdf.png',
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      note['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      note['size']!,
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
