import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool courseUpdates = true;
  bool reminders = true;
  bool offers = true;
  bool generalNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Notification Settings"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 300),
            child: _buildSettingCard(
              icon: Icons.school_outlined,
              title: "Course Updates",
              value: courseUpdates,
              onChanged: (val) => setState(() => courseUpdates = val),
            ),
          ),
          const SizedBox(height: 14),
          FadeInUp(
            duration: const Duration(milliseconds: 350),
            child: _buildSettingCard(
              icon: Icons.schedule_outlined,
              title: "Reminders & Schedules",
              value: reminders,
              onChanged: (val) => setState(() => reminders = val),
            ),
          ),
          const SizedBox(height: 14),
          FadeInUp(
            duration: const Duration(milliseconds: 400),
            child: _buildSettingCard(
              icon: Icons.local_offer_outlined,
              title: "Offers & Promotions",
              value: offers,
              onChanged: (val) => setState(() => offers = val),
            ),
          ),
          const SizedBox(height: 14),
          FadeInUp(
            duration: const Duration(milliseconds: 450),
            child: _buildSettingCard(
              icon: Icons.notifications_active_outlined,
              title: "General App Notifications",
              value: generalNotifications,
              onChanged: (val) => setState(() => generalNotifications = val),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
