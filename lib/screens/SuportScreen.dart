import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  void _launchCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '1800123456');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@coachingapp.com',
      query: 'subject=App Support&body=Hello, I need help with...',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Support',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FadeInDown(
            child: Center(
              child: const Text(
                "How can we help you?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          //const SizedBox(height: 20),

          // FAQs
          SlideInLeft(
            child: _buildCard(
              icon: Icons.help_outline,
              iconColor: Colors.blue,
              title: "Frequently Asked Questions",
              onTap: () {
                // Navigate to FAQ screen
              },
            ),
          ),

          // Call Support
          SlideInRight(
            child: _buildCard(
              icon: Icons.call,
              iconColor: Colors.green,
              title: "Call Support",
              subtitle: "1800-123-456",
              onTap: _launchCall,
            ),
          ),

          // Email Us
          SlideInLeft(
            child: _buildCard(
              icon: Icons.email_outlined,
              iconColor: Colors.red,
              title: "Email Us",
              subtitle: "support@coachingapp.com",
              onTap: _launchEmail,
            ),
          ),

          // Raise a Ticket
          SlideInRight(
            child: _buildCard(
              icon: Icons.report_problem_outlined,
              iconColor: Colors.orange,
              title: "Raise a Ticket",
              onTap: () {
                // Navigate to Ticket Form
              },
            ),
          ),

          // App Version
          FadeInUp(
            child: _buildCard(
              icon: Icons.info_outline,
              iconColor: Colors.grey,
              title: "App Version",
              subtitle: "v1.0.0",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      ),
    );
  }
}
