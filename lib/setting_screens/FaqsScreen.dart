import 'package:flutter/material.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final List<Map<String, String>> faqs = const [
    {
      "question": "1. What is the validity period of the purchased courses?",
      "answer":
          "All purchased courses come with a specific validity period, typically ranging from 6 months to 1 year depending on the course. Please refer to the course details for exact validity."
    },
    {
      "question": "2. Are the mock tests aligned with the latest exam pattern?",
      "answer":
          "Yes, all mock tests are designed and updated regularly by subject matter experts to ensure alignment with the most recent exam patterns and syllabus."
    },
    {
      "question": "3. Can I access the courses on multiple devices?",
      "answer":
          "You can access the course on one mobile device and one web browser simultaneously. Sharing login credentials with others may lead to account suspension."
    },
    {
      "question": "4. Is there any doubt clearing support available?",
      "answer":
          "Yes, most of our courses offer structured doubt support via discussion forums, live Q&A sessions, or through one-on-one chat with mentors."
    },
    {
      "question": "5. How often is the content updated?",
      "answer":
          "Our academic team continuously monitors changes in exam trends and updates the content accordingly, usually on a monthly or quarterly basis."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("FAQs"),
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                faq['question']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faq['answer']!,
                    style: const TextStyle(height: 1.5),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
