import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade300,
        elevation: 1,
        title: const Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to ExamPrep App!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "These Terms & Conditions govern your use of our application designed for government exam preparation such as UPSC, SSC, Banking, Railways, and State Level Exams. By accessing or using the app, you agree to comply with these terms.",
              style: TextStyle(fontSize: 15, height: 1.6),
            ),
            SizedBox(height: 20),
            Text(
              "1. User Eligibility",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "This app is intended for students preparing for competitive exams. You must be at least 13 years old to use this app.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "2. Account Security",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "You are responsible for maintaining the confidentiality of your login credentials. Sharing of accounts is strictly prohibited.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "3. Course & Content Usage",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "All content including PDFs, videos, mock tests, and quizzes are for personal learning only. Reproduction, distribution, or resale is not allowed without written permission.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "4. Subscription & Refund",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "Subscriptions once purchased are non-refundable. However, if you face any issue, you may contact our support team for resolution.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "5. Prohibited Activities",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "Users must not engage in hacking, cheating, or disrupting the app’s performance. Any violation may lead to account suspension or legal action.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "6. Updates to Terms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "We may update these Terms periodically. Continued use of the app means you accept the updated Terms.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              "7. Contact & Support",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "For any queries or complaints, please contact us at support@examprep.com.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Thank you for trusting ExamPrep!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
