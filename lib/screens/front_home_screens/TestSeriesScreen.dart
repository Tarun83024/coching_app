import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testseriesscreen extends StatefulWidget {
  const Testseriesscreen({super.key});

  @override
  State<Testseriesscreen> createState() => _TestseriesscreenState();
}

class _TestseriesscreenState extends State<Testseriesscreen> {
  List<bool> expansionState =
      List.generate(22, (index) => false); // adjust count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back,
              color: Colors.white), // iOS-style icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Test Series',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: expansionState[index]
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      )
                    ],
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (value) {
                  setState(() {
                    expansionState[index] = value;
                  });
                },
                title: Text(
                  titles[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  expansionState[index] ? Icons.expand_less : Icons.expand_more,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        courseCard(
                          title: 'IAS Foundation GS',
                          rating: '4.2',
                          videos: '260+ Videos',
                          price: '₹590',
                        ),
                        const SizedBox(height: 10),
                        courseCard(
                          title: 'Law Optional Paper I',
                          rating: '4.9',
                          videos: '25+ Videos',
                          price: '₹440',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget courseCard({
    required String title,
    required String rating,
    required String videos,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/UPSC.jpg', width: 60, height: 60),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(rating),
                    const SizedBox(width: 10),
                    const Icon(Icons.play_circle_outline,
                        size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(videos),
                  ],
                )
              ],
            ),
          ),
          Text(price,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  List<String> titles = [
    'IAS (UPSC)',
    'HPSC (Haryana Public Service Commission)',
    'RAS',
    'Assistant Professor (College Education)',
    'राजस्थान पुलिस',
    'स्कूल व्याख्याता',
    '2nd Grade Teacher',
    'Lab Assistant',
    '3rd Grade Teacher (L1 & L2)',
    'ग्राम विकास अधिकारी(VDO)',
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
}
