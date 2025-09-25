import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MySubscriptionsScreen extends StatelessWidget {
  const MySubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subscriptions = [
      {
        'title': 'SSC CGL Complete Course',
        'expiry': 'Valid till: 12 Dec 2025',
        'price': '₹1499',
        'progress': 0.75,
      },
      {
        'title': 'UPSC Prelims Test Series',
        'expiry': 'Valid till: 05 Nov 2024',
        'price': '₹799',
        'progress': 0.40,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Subscriptions"),
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final sub = subscriptions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sub['title'],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                LinearPercentIndicator(
                  lineHeight: 10.0,
                  percent: sub['progress'],
                  backgroundColor: Colors.grey.shade300,
                  progressColor: Colors.blue.shade300,
                  barRadius: const Radius.circular(10),
                  animation: true,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sub['expiry'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13.5,
                      ),
                    ),
                    Text(
                      sub['price'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                    ),
                    onPressed: () {
                      // TODO: Navigate to the respective course screen
                    },
                    icon: const Icon(Icons.play_circle_fill_rounded,
                        size: 20, color: Colors.white),
                    label: const Text(
                      "Go to Course",
                      style: TextStyle(fontSize: 14.5, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
