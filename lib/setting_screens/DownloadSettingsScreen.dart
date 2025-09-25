import 'package:flutter/material.dart';

class DownloadSettingsScreen extends StatefulWidget {
  const DownloadSettingsScreen({super.key});

  @override
  State<DownloadSettingsScreen> createState() => _DownloadSettingsScreenState();
}

class _DownloadSettingsScreenState extends State<DownloadSettingsScreen> {
  String _downloadQuality = 'High';
  bool _wifiOnly = true;
  bool _autoDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Download Settings"),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDropdownSetting(
            title: "Download Quality",
            value: _downloadQuality,
            items: const ['Low', 'Medium', 'High'],
            onChanged: (value) => setState(() => _downloadQuality = value!),
          ),
          const SizedBox(height: 16),
          _buildSwitchSetting(
            title: "Download over Wi-Fi only",
            value: _wifiOnly,
            onChanged: (val) => setState(() => _wifiOnly = val),
          ),
          const SizedBox(height: 16),
          _buildSwitchSetting(
            title: "Auto-delete watched videos",
            value: _autoDelete,
            onChanged: (val) => setState(() => _autoDelete = val),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownSetting({
    required String title,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            onChanged: onChanged,
            items: items
                .map((val) => DropdownMenuItem(
                      value: val,
                      child: Text(val),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchSetting({
    required String title,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
